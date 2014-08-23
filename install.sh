#!/bin/bash

# This command was take from
# https://github.com/mikeyk/dotfiles/blob/master/setup_symlinks.sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


ln -fs $DIR/bashrc ~/.bashrc
ln -fs $DIR/vimrc ~/.vimrc
ln -fs $DIR/emacs ~/.emacs
ln -fs $DIR/gitconfig ~/.gitconfig
