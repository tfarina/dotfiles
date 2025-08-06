#!/usr/bin/env bash
#
# Applies XFCE configuration XML files from the dotfiles repository to the
# system config directory.
# Restores:
# - xfwm4.xml and xsettings.xml (window manager and font/rendering settings)
# - xfce4-panel.xml (panel layout)
# - panel directory (~/.config/xfce4/panel) with launchers and plugin data
# - xfce4-keyboard-shortcuts.xml
#
# Prompts before overwriting existing files or panel directory.
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
    xfce4-keyboard-shortcuts.xml
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

# Handle panel directory (launchers and plugin data)
PANEL_DIR_SRC="xfce/.config/xfce4/panel"
PANEL_DIR_DEST="$HOME/.config/xfce4/panel"

if [[ -d "$PANEL_DIR_SRC" ]]; then
    if [[ -d "$PANEL_DIR_DEST" ]]; then
	read -rp "Overwrite existing panel directory ($PANEL_DIR_DEST)? [y/N] " answer
	case "$answer" in
	    [Yy]* )
		cp -r "$PANEL_DIR_SRC/"* "$PANEL_DIR_DEST/"
		echo "Overwrote panel directory"
		PANEL_UPDATED=1
		;;
	    * )
		echo "Skipped panel directory"
		;;
	esac
    else
	mkdir -p "$PANEL_DIR_DEST"
	cp -r "$PANEL_DIR_SRC/"* "$PANEL_DIR_DEST/"
	echo "Installed panel directory"
	PANEL_UPDATED=1
    fi
else
    echo "Panel directory not found in dotfiles: $PANEL_DIR_SRC"
fi

# Restart panel if necessary
if [[ "$PANEL_UPDATED" -eq 1 ]]; then
    echo "Restarting XFCE panel to apply layout changes..."
    xfce4-panel --restart
fi

echo "XFCE config XML files applied from dotfiles to system."
