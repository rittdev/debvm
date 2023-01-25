#!/bin/bash

# base

apt-get -y install \
	aptitude-common

apt-get -y install --no-install-recommends \
	logrotate \
	vim \
	bzip2 \
	openssh-server \
	curl \
	ca-certificates

# xfce

apt-get -y install --no-install-recommends \
	xorg \
	xfwm4 \
	xfdesktop4 \
	xfce4-session \
	thunar \
	xfce4-terminal \
	shiki-colors-xfwm-theme \
	greybird-gtk-theme \
	blackbird-gtk-theme

# sound

apt-get -y install --no-install-recommends \
	alsa-utils

# vmware support

apt-get -y install --no-install-recommends \
	open-vm-tools-desktop

# web and pdf

apt-get -y install --no-install-recommends \
	libdbus-glib-1-2

# firefox support
apt-get -y install --no-install-recommends \
	libgtk-3-common \
	libgtk-3-bin \
	pulseaudio

# config normal user

useradd -m -G audio,cdrom,video,dialout -s /bin/bash ritt

# set hostname and stop bell

DEBVM_NAME="d`date --utc +'%y%m%d%H%M'`"

sed -i "s/# set bell-style none/set bell-style none/g" /etc/inputrc

sed -i "s/debian/${DEBVM_NAME}/g" /etc/hostname

sed -i "s/debian/${DEBVM_NAME}/g" /etc/hosts

# config user

curl -O https://rittdev.com/debvm/config.sh

mv config.sh /home/ritt/config.sh

chmod a+x /home/ritt/config.sh

chown ritt:ritt /home/ritt/config.sh

su - ritt -c /home/ritt/config.sh
