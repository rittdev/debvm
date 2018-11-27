#!/bin/bash

rm mini.iso
rm re201deb32.iso
rm re201deb64.iso
rm txt.cfg
rm -rf cd32
rm -rf cd64

curl -O https://rittdev.com/debvm/txt.cfg

curl -O http://ftp.nl.debian.org/debian/dists/stable/main/installer-i386/current/images/netboot/mini.iso

mv mini.iso mini32.iso

curl -O http://ftp.nl.debian.org/debian/dists/stable/main/installer-amd64/current/images/netboot/mini.iso

mv mini.iso mini64.iso

mkdir cd32
mkdir cd64

bsdtar -C cd32 -xf mini32.iso
bsdtar -C cd64 -xf mini64.iso

chmod -R +w cd32
chmod -R +w cd64

cp txt.cfg cd32/
cp txt.cfg cd64/

genisoimage \
 -o rittdev-debvm32.iso \
 -r -J -no-emul-boot \
 -boot-load-size 4 \
 -boot-info-table \
 -b isolinux.bin \
 -c boot.cat \
 ./cd32

genisoimage \
 -o rittdev-debvm64.iso \
 -r -J -no-emul-boot \
 -boot-load-size 4 \
 -boot-info-table \
 -b isolinux.bin \
 -c boot.cat \
 ./cd64
