# dotfiles

Minimal and maintainable dotfiles for a functional Linux desktop — neatly
managed with [GNU Stow](https://www.gnu.org/software/stow/).

![img desktop](screenshots/ubuntu_xfce_desktop_launcher_mail_client_2025-08-04_11-09-54.png)

## What are dotfiles?

Dotfiles are user-specific configuration files on Unix-like systems,
typically hidden because their names begin with a dot (e.g. `.bashrc`,
`.profile`).
[Read more on their origin →](./history_of_dotfiles.md)

## **System Documentation**
- [System Info](./system_info.md)
- [Environment Setup](./environment.md)

## Programs

| Role  | Program |
| ------------- | ------------- |
| Boot Loader | [GRUB 2](https://www.gnu.org/software/grub/index.html) |
| Display Manager | [LightDM](https://github.com/canonical/lightdm) |
| Greeter | [LightDM GTK+ Greeter](https://github.com/Xubuntu/lightdm-gtk-greeter) |
| Session Manager | [xfce4-session](https://docs.xfce.org/xfce/xfce4-session/start) |
| Window Manager | [xfwm4](https://docs.xfce.org/xfce/xfwm4/start) |
| Panel | [xfce4-panel](https://docs.xfce.org/xfce/xfce4-panel/start) |
| Terminal Emulator | [URxvt](http://software.schmorp.de/pkg/rxvt-unicode.html) |
| Shell | [Bash](https://www.gnu.org/software/bash/) |
| Editor | [Emacs](https://www.gnu.org/software/emacs/) |
| Text Editor | [Gedit](https://gitlab.gnome.org/World/gedit/gedit/-/tree/master) |
| Application Finder | [xfce4-appfinder](https://docs.xfce.org/xfce/xfce4-appfinder/start) |
| Web Browser | [Firefox](https://www.mozilla.org/en-US/firefox/new) |
| Mail Reader | [Claws Mail](https://www.claws-mail.org), [Thunderbird](https://www.thunderbird.net/en-US/) |
| File Manager | [Thunar](https://gitlab.xfce.org/xfce/thunar) |
| Image Viewer | [Sxiv](https://github.com/muennich/sxiv), [Ristretto](https://docs.xfce.org/apps/ristretto/start) |
| Screen Capture | [Scrot](https://github.com/dreamer/scrot), [GNOME Screenshot](https://gitlab.gnome.org/GNOME/gnome-screenshot), [Xfce Screenshooter](https://docs.xfce.org/apps/xfce4-screenshooter/start) |
| Document Viewer | [Evince](https://wiki.gnome.org/Apps/Evince) |
| Clipboard Manager | [ClipIt](https://github.com/CristianHenzel/ClipIt) |
| Calculator | [galculator](http://galculator.mnim.org/) |

## Xfce Keyboard Shortcuts

| Press         | To            |
| ------------- | ------------- |
| Ctrl + Esc  | Display the Start menu |
| Super | Display the Start menu |
| Super + D | Minimize or restore all windows |
| Super + E | Open the File Manager |
| Super + L | Lock the screen |
| Super + R | Open the Application Finder |
| Shift + Super + S | Open the Screenshot program |
| Super + T | Open the Terminal Emulator |
| Super + W | Open the Web Browser |
| Ctrl + Shift + Esc  | Open the Task Manager |

## Installation

Before installing, read cowboy’s [gently-worded warning](https://github.com/cowboy/dotfiles#heed-this-critically-important-warning-before-you-install) and Anish Athalye’s [Dotfiles are NOT meant to be forked](http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/).

1. **Install GNU Stow**

```sh
sudo apt install stow
```

2. **Clone this repo**

```sh
git clone https://github.com/tfarina/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

3. **Stow desired config folders**

```sh
stow -v -t ~/ -S bash
stow -v -t ~/ -S emacs
```

## Tips & Troubleshooting

### How to disable overlay scrollbars

```sh
gsettings set com.canonical.desktop.interface scrollbar-mode normal
```

### How to show the GRUB menu?

- Press and hold **Shift** as soon as BIOS loads.
- On UEFI systems, press **Esc** instead.

### How to disable GTK3 CSD (Client-Side Decorations)?

1. Download the `.deb` packages from [Debian's gtk3-nocsd package](https://packages.debian.org/trixie/all/gtk3-nocsd/download)

2. Install with `dpkg -i` and reboot

### How to get monospace font name used by Emacs?

```sh
gsettings get org.gnome.desktop.interface monospace-font-name
```

### How to get the name of default font on Xfce?

```sh
xfconf-query -c xsettings -p /Gtk/FontName
```

### How to fix macOS keyboard typing issue?

- Go to **System Preferences** > **Keyboard**
- Set the following:
  - **Key Repeat**: Fast
  - **Delay Until Repeat**: Short
