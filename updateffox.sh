#!/bin/bash

if [ -x /usr/bin/curl ] ; then
DOWNLOADER='curl -O'
else
DOWNLOADER='wget'
fi

FIREFOX_VERSION=75.0

FIREFOX_FILE="firefox-$FIREFOX_VERSION.tar.bz2"
BOOKMARKS_FILE="bookmarks-blank.json"
DEBVM_URL="https://rittdev.com/debvm"


if [ -e $FIREFOX_FILE ]
then
	rm $FIREFOX_FILE
fi

if [ -e $BOOKMARKS_FILE ]
then
	rm -f $BOOKMARKS_FILE
fi

if [ ! -d Downloads ]
then
	mkdir Downloads
fi

$DOWNLOADER http://download-origin.cdn.mozilla.net/pub/mozilla.org/firefox/releases/$FIREFOX_VERSION/linux-`uname -m`/en-US/$FIREFOX_FILE

tar xvjf $FIREFOX_FILE

$DOWNLOADER $DEBVM_URL/firefox/autoconfig.js
$DOWNLOADER $DEBVM_URL/firefox/rittdev.cfg
$DOWNLOADER $DEBVM_URL/firefox/${BOOKMARKS_FILE}

mv autoconfig.js firefox/defaults/pref/
mv rittdev.cfg firefox/



