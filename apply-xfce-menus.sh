#!/bin/bash

set -e

echo "Setting up XFCE custom menus..."

# User menu
mkdir -p ~/.config/menus
cp ./xfce/menus/config/xfce-applications.menu ~/.config/menus/

# .desktop files
mkdir -p ~/.local/share/applications
cp ./xfce/menus/applications/*.desktop ~/.local/share/applications/

# .directory files
mkdir -p ~/.local/share/desktop-directories
cp ./xfce/menus/desktop-directories/*.directory ~/.local/share/desktop-directories/

echo "XFCE menus applied. You may need to log out or restart panel to see changes."
