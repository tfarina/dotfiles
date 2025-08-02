#!/usr/bin/env bash
#
# Syncs XFCE configuration XML files from the current system into the
# dotfiles repository. Specifically copies xfwm4.xml and xsettings.xml,
# which may include font, window manager, and rendering settings.
#
# Run this script after making changes via the XFCE UI to preserve your
# setup.
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

SRC_DIR="$HOME/.config/xfce4/xfconf/xfce-perchannel-xml"
DEST_DIR="xfce/.config/xfce4/xfconf/xfce-perchannel-xml"

mkdir -p "$DEST_DIR"

for file in xfwm4.xml xsettings.xml; do
    src="$SRC_DIR/$file"
    dest="$DEST_DIR/$file"

    cp "$src" "$dest"
    echo "Installed: $file"
done

echo "XFCE config XML files synced from system to dotfiles."
