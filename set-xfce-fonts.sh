#!/usr/bin/env bash
#
# Configures XFCE font settings and font rendering options using xfconf-query.
# Applies GTK font, window title font, antialiasing, hinting, subpixel order,
# LCD filter, and DPI (in standard integer value, e.g. 96).
#
# Use this script to enforce consistent font appearance across XFCE setups.
#
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

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

echo "XFCE fonts and rendering settings configured via xfconf-query."
