#!/bin/bash

echo
echo "Installing Ninja..."

VERSION=1.5.3
NINJA_VERSION=ninja-$VERSION
wget http://github.com/martine/ninja/archive/v$VERSION/$NINJA_VERSION.tar.gz
tar -zxvf $NINJA_VERSION.tar.gz
cd $NINJA_VERSION
./configure.py --bootstrap
sudo install -D --verbose --backup=none --mode=755 -T ninja /usr/local/bin/ninja
cd ..
rm -rf $NINJA_VERSION
rm $NINJA_VERSION.tar.gz
