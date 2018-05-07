#!/bin/bash

# base

apt-get -y install \
	aptitude-common

apt-get -y install --no-install-recommends \
	logrotate \
	vim \
	bzip2 \
	openssh-server

# xfce

apt-get -y install --no-install-recommends \
	xorg \
	xfwm4 \
	xfdesktop4 \
	xfce4-session \
	thunar \
	xfce4-terminal \
	gtk3-engines-xfce \
	shiki-colors-xfwm-theme

# sound

apt-get -y install --no-install-recommends \
	alsa-utils

# vmware support

apt-get -y install --no-install-recommends \
	open-vm-tools-desktop

# web and pdf

apt-get -y install --no-install-recommends \
	libdbus-glib-1-2


# firefox reqs
apt-get -y install --no-install-recommends \
	libgtk-3-common \
	libgtk-3-bin \
	pulseaudio


# config normal user

useradd -m -G audio,cdrom,video,dialout -s /bin/bash rittdev

