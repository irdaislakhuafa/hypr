#!/usr/bin/sh
ignores=(
	sda{0..10}
)
alphabet=( {a..z} )
skiped_limit=5

skiped=0
for ((a = 0 ; a <= 25; a++))
do
	for ((b = 0 ; b <= 128; b++))
	do
		part=${alphabet[a]}
		dev=$(ls /dev | grep sd$part$b)
		current="sd$part$b"


		if [ "$dev" != "" ] && [ "$(echo ${ignores[@]} | grep $dev)" == '' ]; then
			if [ "$dev" == "$current" ]; then
				echo "mounting device $dev"
				udisksctl mount -b /dev/$dev &!
			else 
				skiped=$(expr $skiped + 1)
				echo "$skiped"
				continue
			fi
		fi
	done

	echo "skiped: $skiped"; sleep 1 

	if [ $skiped -gt $skiped_limit ]; then
		exit 0
	fi
done
