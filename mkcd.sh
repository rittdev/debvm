#!/bin/bash

function make_cd {
# params: version architecture

curl -O https://rittdev.com/debvm/txt.cfg

if [ $1 == "stable" ]; then
	URL="http://ftp.us.debian.org/debian/dists/stable/main/installer-$2/current/images/netboot/mini.iso"
else
	URL="https://d-i.debian.org/daily-images/$2/daily/netboot/mini.iso"
fi

curl -O $URL

mkdir image

bsdtar -C image -xf mini.iso

chmod -R +w image

cp txt.cfg image/

sed -i "s/psdeb-stable/psdeb-$1/g" image/txt.cfg


genisoimage \
 -input-charset utf-8 \
 -o rittdev-$1-$2.iso \
 -r -J -no-emul-boot \
 -boot-load-size 4 \
 -boot-info-table \
 -b isolinux.bin \
 -c boot.cat \
 ./image

rm -rf image
rm mini.iso
}

make_cd stable amd64
make_cd unstable amd64
make_cd stable i386
make_cd unstable i386

