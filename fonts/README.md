# Fonts

## Finding Emacs’ monospace font

```sh
gsettings get org.gnome.desktop.interface monospace-font-name
```

## Finding Xfce’ default font
To see which font Xfce is using by default:

```sh
xfconf-query -c xsettings -p /Gtk/FontName
```
