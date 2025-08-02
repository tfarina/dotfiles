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

CONFIG_FILES=(
    xfwm4.xml
    xsettings.xml
    xfce4-panel.xml
)

PANEL_UPDATED=0

for file in "${CONFIG_FILES[@]}"; do
    src="$SRC_DIR/$file"
    dest="$DEST_DIR/$file"

    if [[ -e "$dest" ]]; then
	read -rp "Overwrite $dest? [y/N] " answer
	case "$answer" in
	    [Yy]* )
		cp "$src" "$dest"
		echo "Overwrote: $file"
                [[ "$file" == "xfce4-panel.xml" ]] && PANEL_UPDATED=1
		;;
	    * )
		echo "Skipped: $file"
		;;
	esac
    else
	cp "$src" "$dest"
	echo "Installed: $file"
	[[ "$file" == "xfce4-panel.xml" ]] && PANEL_UPDATED=1
    fi
done

if [[ "$PANEL_UPDATED" -eq 1 ]]; then
    echo "Restarting XFCE panel to apply layout changes..."
    xfce4-panel --restart
fi

echo "XFCE config XML files applied from dotfiles to system."
