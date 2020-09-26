# dotfiles

They're managed using [GNU stow](https://www.gnu.org/software/stow/).

## Installation

### Before installing, be sure to read useful cowboy [gently-worded note](https://github.com/cowboy/dotfiles#heed-this-critically-important-warning-before-you-install) and this excellent article by Anish Athalye: [Dotfiles are NOT meant to be forked](http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/). That said, let's go with the installation:

1. **Install GNU Stow:** GNU Stow is available for all GNU+Linux distros and most other unix-like distributions via your package manager.

- `sudo apt install stow`
- `sudo pacman -S stow`
- `brew install stow`

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
