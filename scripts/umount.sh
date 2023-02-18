#!/usr/bin/sh
alphabet=( {a..z} )
part=""
for ((a = 0 ; a <= 25; a++))
do
	for ((b = 0 ; b <= 128; b++))
	do
		part=${alphabet[a]}
		dev=$(ls /dev | grep sd$part$b)
		current="sd$part$b"
		if [ "$dev" == "$current" ]; then
			udisksctl unmount -b /dev/$dev &!
			
		fi
	done
	udisksctl power-off -b /dev/sd$part &!
done
