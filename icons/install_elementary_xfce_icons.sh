#!/bin/bash

sudo cp -r elementary-xfce/ /usr/share/icons
sudo cp -r elementary-xfce-dark/ /usr/share/icons
sudo cp -r elementary-xfce-darker/ /usr/share/icons
sudo cp -r elementary-xfce-darkest/ /usr/share/icons

sudo gtk-update-icon-cache -f /usr/share/icons/elementary-xfce
sudo gtk-update-icon-cache -f /usr/share/icons/elementary-xfce-dark
sudo gtk-update-icon-cache -f /usr/share/icons/elementary-xfce-darker
sudo gtk-update-icon-cache -f /usr/share/icons/elementary-xfce-darkest
