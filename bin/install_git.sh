#!/bin/bash

GIT_VERSION=git-2.1.2
wget https://www.kernel.org/pub/software/scm/git/$GIT_VERSION.tar.gz
extract $GIT_VERSION.tar.gz
cd $GIT_VERSION/
make configure
./configure --prefix=/usr
make all
sudo make install
