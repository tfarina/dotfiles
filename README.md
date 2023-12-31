# dotfiles

They're managed using [GNU stow](https://www.gnu.org/software/stow/).

## Intro

> The legend goes that dot-files arose from a bug in the earliest days of
> UNIX: in an effort to avoid listing the . and .. entries of a directory,
> the ls command skipped files that began with the '.' character. As a result,
> any file with a name beginning with '.' was not reported by ls, i.e. it was
> a "hidden" file.
> A user's home directory was a convenient place to put user-specific
> configuration files, but such files were also an eyesore; one popular
> solution to this problem was to make those configuration files hidden so
> that they wouldn't annoy the user.
> Thus, the tradition of dot-files was born.
> From [Quora](https://www.quora.com/What-are-dotfiles/answer/Costya-Perepelitsa)

## What is a Rice?

> "Rice" is a word that is commonly used to refer to making visual improvements
> and customizations on one's desktop. It was inherited from the practice of
> customizing cheap Asian import cars to make them appear to be faster than
> they actually were - which was also known as "ricing".
From [/r/unixporn](https://www.reddit.com/r/unixporn/wiki/themeing/dictionary#wiki_rice)

## Programs

| Role  | Program |
| ------------- | ------------- |
| Display Manager | [LightDM](https://github.com/canonical/lightdm) |
| Greeter | [LightDM GTK+ Greeter](https://github.com/Xubuntu/lightdm-gtk-greeter) |
| Terminal Emulator | [URxvt](http://software.schmorp.de/pkg/rxvt-unicode.html) |
| Shell | [Bash](https://www.gnu.org/software/bash/) |
| Application Launcher | [Rofi](https://github.com/davatorium/rofi) |
| Web Browser | [Firefox](https://www.mozilla.org/en-US/firefox/new) |
| Mail Reader | [Claws Mail](https://www.claws-mail.org) |
| File Manager | [Thunar](https://gitlab.xfce.org/xfce/thunar) |
| Image Viewer | [Sxiv](https://github.com/muennich/sxiv) |
| Screen Capture | [Scrot](https://github.com/dreamer/scrot) |
| Document Viewer | [Zathura](https://pwmt.org/projects/zathura) |
| Clipboard Manager | [ClipIt](https://github.com/CristianHenzel/ClipIt) |
| Calculator | [galculator](http://galculator.mnim.org/) |

# Xfce Keyboard Shortcuts

| Key Binding | Associated Action | Category |
| ------------- | ------------- | --------------------- |
| super + R | Open the Application Finder | General |
| super + E | Display Thunar File Manager | General |
| super + L | Lock the screen | General |
| ctrl + alt + D | Show desktop | General |

# sxhkd key bindings

| Key Binding | Associated Action | Category |
| ------------- | ------------- | --------------------- |
| super + Escape | Reload sxhkd configuration's file | General |
| super + Return | Open a new terminal | General |
| super + slash | Open the Application Finder | General |
| super + l | Lock the screen | General |
| super + shift + q | Quit bspwm | BSPWM |
| super + shift + r | Restart bspwm | BSPWM |

## Installation

### Before installing, be sure to read useful cowboy [gently-worded note](https://github.com/cowboy/dotfiles#heed-this-critically-important-warning-before-you-install) and this excellent article by Anish Athalye: [Dotfiles are NOT meant to be forked](http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/). That said, let's go with the installation:

1. **Install GNU Stow:** GNU Stow is available for all GNU+Linux distros and most other unix-like distributions via your package manager.

   Ubuntu:   `sudo apt install stow`
   Arch:     `sudo pacman -S stow`
   Mac:	     `brew install stow`

2. **Clone this repo:**

```sh
$ git clone https://github.com/tfarina/dotfiles.git ~/dotfiles && cd ~/dotfiles
```
3. **Symlink with GNU Stow the folder(s) you want to your home:** To install most of my dotfiles you execute `stow` with the folder name as the only argument.
For example, to install my `sxhkd` and my `zshrc` config use the command:

```sh
$ stow -v -t ~/ -S sxhkd
$ stow -v -t ~/ -S zsh
$ stow -v -t ~/ -S whatever-dotfile-you-want
```
This will symlink files to `~/.config/sxhkd/`, `~/.zshrc`, etc.
