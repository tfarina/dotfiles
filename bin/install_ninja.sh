#!/bin/bash

echo
echo "Installing Ninja..."

NINJA_VERSION=v1.5.3
wget https://github.com/martine/ninja/archive/$NINJA_VERSION.tar.gz
tar -zxvf $NINJA_VERSION.tar.gz
cd ninja-1.5.3
./configure.py --bootstrap
sudo cp ninja /usr/local/bin/
cd ..
rm -rf ninja-1.5.3
rm $NINJA_VERSION.tar.gz
