#!/usr/bin/env bash
#
# Configure XFCE desktop appearance and settings.
#
# This script applies a consistent XFCE configuration using xfconf-query,
# including:
#   - GTK and window manager themes
#   - Icon and cursor themes
#   - Fonts and font rendering options
#   - Wallpaper
#
# It is intended to be safe to re-run and to enforce a reproducible
# XFCE desktop setup.
#
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# ---------------------
# Themes and appearance
# ---------------------

# GTK theme
xfconf-query -c xsettings -p /Net/ThemeName -s "Clearlooks-Phenix-Modified"

# Icon theme
xfconf-query -c xsettings -p /Net/IconThemeName -s "elementary-xfce"

# Cursor theme and size
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "Bluecurve-inverse"
xfconf-query -c xsettings -p /Gtk/CursorThemeSize -s 16

# Window manager theme (titlebars, borders)
xfconf-query -c xfwm4 -p /general/theme -s "Clearlooks-Phenix-Modified"

# Wallpaper
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image \
	     -s "/usr/share/backgrounds/leonidas-1-noon.jpg"

# -----
# Fonts
# -----

# Set font names
xfconf-query -c xsettings -p /Gtk/FontName -s "DejaVu Sans 10"
xfconf-query -c xfwm4 -p /general/title_font -s "DejaVu Sans Bold 10"

# Set rendering settings
xfconf-query -c xsettings -p /Xft/Antialias -s 1
xfconf-query -c xsettings -p /Xft/Hinting -s 1
xfconf-query -c xsettings -p /Xft/HintStyle -s "hintslight"
xfconf-query -c xsettings -p /Xft/RGBA -s "rgb"
xfconf-query -c xsettings -p /Xft/Lcdfilter -s "lcddefault"

# Set DPI
xfconf-query -c xsettings -p /Xft/DPI -s 96

# ---------------
# Desktop refresh
# ---------------

# Reload desktop background
xfdesktop --reload

echo "XFCE desktop configuration applied."
