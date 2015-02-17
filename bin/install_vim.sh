#!/bin/bash

# https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

sudo apt-get install libncurses5-dev \
                     libgnome2-dev \
                     libgnomeui-dev \
                     libgtk2.0-dev \
                     libatk1.0-dev \
                     libbonoboui2-dev \
                     libcairo2-dev \
                     libx11-dev \
                     libxpm-dev \
                     libxt-dev \
                     python-dev \
                     ruby-dev \
                     mercurial

# sudo apt-get remove vim vim-runtime gvim
# sudo apt-get remove vim-tiny vim-common vim-gui-common

wget http://ftp.vim.org/vim/unix/vim-7.4.tar.bz2
extract vim-7.4.tar.bz2
cd vim74
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install
