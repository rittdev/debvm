#!/bin/bash

# base

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
	xserver-xorg-video-vmware \
	xfwm4 \
	xfdesktop4 \
	xfce4-session \
	thunar \
	xfce4-terminal \
	librsvg2-common \
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

apt-get -y install --no-install-recommends \
	ffmpeg

# config normal user

timedatectl set-timezone America/New_York

curl -O https://rittdev.com/debvm/config.sh

mv config.sh /home/ritt/config.sh

chmod a+x /home/ritt/config.sh

chown ritt:ritt /home/ritt/config.sh

su - ritt -c /home/ritt/config.sh
