#!/bin/bash
#
# Update dotfiles with the current XFCE user menu configuration.
# Copies from ~/.config/menus and ~/.local/share/... into this repo.
#

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
XFCE_MENUS_DIR="$DOTFILES_DIR/xfce/menus"
CONFIG_DIR="$XFCE_MENUS_DIR/config"
APPS_DIR="$XFCE_MENUS_DIR/applications"
DIRS_DIR="$XFCE_MENUS_DIR/desktop-directories"

echo "Updating XFCE menu files from system into dotfiles..."

mkdir -p "$CONFIG_DIR" "$APPS_DIR" "$DIRS_DIR"

# Pull menu configuration
if [ -f "$HOME/.config/menus/xfce-applications.menu" ]; then
    cp "$HOME/.config/menus/xfce-applications.menu" "$CONFIG_DIR/"
    echo "✓ Updated xfce-applications.menu"
else
    echo "⚠ No xfce-applications.menu found in ~/.config/menus/"
fi

# Pull .desktop files (only those that you already track)
for f in "$APPS_DIR"/*.desktop; do
    base="$(basename "$f")"
    src="$HOME/.local/share/applications/$base"
    if [ -f "$src" ]; then
	cp "$src" "$APPS_DIR/"
	echo "✓ Updated $base"
    fi
done

# Pull .directory files (if you ever add any)
for f in "$DIRS_DIR"/*.directory; do
    base="$(basename "$f")"
    src="$HOME/.local/share/desktop-directories/$base"
    if [ -f "$src" ]; then
	cp "$src" "$DIRS_DIR/"
	echo "✓ Updated $base"
    fi
done

echo "Done. Dotfiles are now updated with the system’s current XFCE menu state."
