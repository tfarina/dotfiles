#!/bin/bash

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

# Reload desktop background
xfdesktop --reload
