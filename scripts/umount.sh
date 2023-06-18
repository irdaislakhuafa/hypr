#!/usr/bin/sh
alphabet=({a..z})
part=""
ignores=(
	sda{1..10}
)
for ((a = 0; a <= 25; a++)); do
	if [ "$(ls /dev | grep sd${alphabet[a]})" == '' ]; then
		continue
	fi

	skip=0
	for ((b = 0; b <= 128; b++)); do
		part=${alphabet[a]}
		dev=$(ls /dev | grep sd$part$b)
		if [ "$dev" == "" ]; then
			continue
		fi

		current="sd$part$b"
		
		if ! [ "$(echo ${ignores[@]} | grep '$dev')" == '' ]; then
			if [ "$dev" == "$current" ]; then
				udisksctl unmount -b /dev/$dev
			fi
		else 
			skip=1
		fi
	done
	#if [ $skip -lt 1 ]; then
		#udisksctl power-off -b /dev/sd$part
	#fi
done
