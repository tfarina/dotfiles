#!/bin/bash

VERSION=2.1.2
wget https://www.kernel.org/pub/software/scm/git/git-$VERSION.tar.gz
extract git-$VERSION.tar.gz
cd git-$VERSION/
make configure
./configure --prefix=/usr
make all
sudo make install
