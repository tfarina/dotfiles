#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


ln -fs $DIR/vimrc ~/.vimrc
ln -fs $DIR/emacs ~/.emacs
ln -fs $DIR/gitconfig ~/.gitconfig
