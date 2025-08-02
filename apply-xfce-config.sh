#!/usr/bin/env bash
#
# Applies XFCE configuration XML files from the dotfiles repository to the
# system config directory. This restores settings like fonts, window manager
# preferences, and rendering options.
#
# Use this after setting up a new system or when you want to restore your
# saved XFCE configuration.
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

DEST_DIR="$HOME/.config/xfce4/xfconf/xfce-perchannel-xml"
SRC_DIR="xfce/.config/xfce4/xfconf/xfce-perchannel-xml"

mkdir -p "$DEST_DIR"

for file in xfwm4.xml xsettings.xml; do
    src="$SRC_DIR/$file"
    dest="$DEST_DIR/$file"

    if [[ -e "$dest" ]]; then
	read -rp "Overwrite $dest? [y/N] " answer
	case "$answer" in
	    [Yy]* )
		cp "$src" "$dest"
		echo "Overwrote: $file"
		;;
	    * )
		echo "Skipped: $file"
		;;
	esac
    else
	cp "$src" "$dest"
	echo "Installed: $file"
    fi
done

echo "XFCE config XML files applied from dotfiles to system."
