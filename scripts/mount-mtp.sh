#!/usr/bin/sh

devices=$(simple-mtpfs -l | wc -l)
devdirs="$(simple-mtpfs -l | grep $devices)"
mediadirs="/media/My_Media/$devdirs"

#if [ -d "$mediadirs" ]; then
#	for ((i=0; i <= $devices; i++));
#	do
#		if [ "$(simple-mtpfs -l | grep $i)" != "" ]

if [ $devices -gt 0 ]; then
	if [ ! -d "$mediadirs" ]; then
		mkdir "$mediadirs"
	fi
	simple-mtpfs --device $devices "$mediadirs" &!
else
	exit 0
fi
