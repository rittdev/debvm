#!/bin/sh

curl -O https://rittdev.com/debvm/updateffox.sh

chmod +x updateffox.sh

./updateffox.sh

mkdir Desktop
cd Desktop

curl -O https://rittdev.com/debvm/Xfce%20Terminal.desktop
curl -O https://rittdev.com/debvm/Firefox.desktop

chmod +x *.desktop

cd ~/

mkdir -p .config/autostart

cd .config/autostart

curl -O https://rittdev.com/debvm/nobeep.desktop

cd ~/


