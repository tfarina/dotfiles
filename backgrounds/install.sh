#!/bin/bash

sudo cp nabia.jpg /usr/share/backgrounds

xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s /usr/share/backgrounds/nabia.jpg
