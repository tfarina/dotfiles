# UI Tweaks

A collection of adjustments to make the desktop environment more
consistent and functional with Xfce.

---

## Disable GTK3 Client-Side Decorations (CSD)

Many GTK3 applications use client-side decorations (CSD), which may
not blend well with traditional window managers such as xfwm.

To disable them, do the following:

1. Download the `.deb` packages from [Debian's gtk3-nocsd package](https://packages.debian.org/trixie/all/gtk3-nocsd/download)

2. Install with `dpkg -i` and reboot

## Disable GTK3 Overlay Scrollbars

Overlay scrollbars can feel distracting or inconsistent with Xfce’s
design.

To disable them, set:

```sh
gsettings set com.canonical.desktop.interface scrollbar-mode normal
```
