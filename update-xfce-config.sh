#!/usr/bin/env bash
#
# Syncs XFCE configuration XML files from the current system into the
# dotfiles repository.
# Copies:
# - xfwm4.xml and xsettings.xml (window manager and font/rendering settings)
# - xfce4-panel.xml (panel layout)
# - panel directory (~/.config/xfce4/panel) with launchers and plugin data
# - xfce4-keyboard-shortcuts.xml
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

CONFIG_FILES=(
    xfwm4.xml
    xsettings.xml
    xfce4-panel.xml
    xfce4-keyboard-shortcuts.xml
)

for file in "${CONFIG_FILES[@]}"; do
    src="$SRC_DIR/$file"
    dest="$DEST_DIR/$file"

    cp "$src" "$dest"
    echo "Synced: $file"
done

# Sync panel directory (launchers and plugin data)
PANEL_DIR_SRC="$HOME/.config/xfce4/panel"
PANEL_DIR_DEST="xfce/.config/xfce4/panel"

if [[ -d "$PANEL_DIR_SRC" ]]; then
    mkdir -p "$PANEL_DIR_DEST"
    cp -r "$PANEL_DIR_SRC/"* "$PANEL_DIR_DEST/"
    echo "Synced panel directory to dotfiles"
else
    echo "Panel directory not found at: $PANEL_DIR_SRC"
fi

echo "XFCE config XML files synced from system to dotfiles."
