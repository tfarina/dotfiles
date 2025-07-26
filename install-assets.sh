#!/bin/bash
set -e

# Set dotfiles root (this script must be in the repo root)
DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "Installing system-wide theme..."
sudo cp -r "$DOTFILES/themes/Clearlooks-Phenix-Modified" /usr/share/themes/

echo "Installing system-wide icons and cursors..."
sudo cp -r "$DOTFILES/icons/elementary-xfce" /usr/share/icons/
sudo cp -r "$DOTFILES/icons/Bluecurve-inverse" /usr/share/icons/

echo "Installing system background..."
sudo cp "$DOTFILES/backgrounds/leonidas-1-noon.jpg" /usr/share/backgrounds/

echo "All assets installed successfully."
