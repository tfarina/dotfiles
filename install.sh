#!/bin/bash

# This command was take from
# https://github.com/mikeyk/dotfiles/blob/master/setup_symlinks.sh
THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp git-prompt.sh $HOME/.git-prompt.sh
cp git-completion.bash $HOME/.git-completion.bash

# This ln command forces the creation of a symbolic link between the locall
# file within this repo with the . one in $HOME.
echo "ln -fs $THIS_DIR/bashrc $HOME/.bashrc"
ln -fs $THIS_DIR/bashrc $HOME/.bashrc
ln -fs $THIS_DIR/bash_functions $HOME/.bash_functions
ln -fs $THIS_DIR/bash_aliases $HOME/.bash_aliases
ln -fs $THIS_DIR/vimrc $HOME/.vimrc
ln -fs $THIS_DIR/emacs $HOME/.emacs
ln -fs $THIS_DIR/gitconfig $HOME/.gitconfig
ln -fs $THIS_DIR/hgrc $HOME/.hgrc
ln -fs $THIS_DIR/i3status.conf $HOME/.i3status.conf
ln -fs $THIS_DIR/i3/config $HOME/.i3/config
ln -fs $THIS_DIR/gdb/stl-views.gdb $HOME/.gdb/stl-views.gdb
ln -fs $THIS_DIR/gdbinit $HOME/.gdbinit
