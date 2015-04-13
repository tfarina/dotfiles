#!/bin/bash

echo
echo "Installing Git..."

GIT_VERSION=git-2.3.0
wget https://www.kernel.org/pub/software/scm/git/$GIT_VERSION.tar.gz
tar -zxvf $GIT_VERSION.tar.gz
cd $GIT_VERSION
make configure
./configure --prefix=/usr
make all
sudo make install
