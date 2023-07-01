#!/usr/bin/sh
source ~/.config/hypr/scripts/env.sh

alphabet=({a..z})
part=""
ignores=(
	sda{0..10}
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
		
		if [ "$dev" != "" ] && [ "$(echo ${ignores[@]} | grep $dev)" == '' ]; then
			if [ "$dev" = "$current" ]; then
				echo "umounting /dev/$dev"
				udisksctl unmount -b /dev/$dev
			fi
		else 
			skip=1
		fi
	done
	if [ $skip -lt 1 ]; then
		udisksctl power-off -b /dev/sd$part
	fi
	success_msg="Success unmounting with device {${ignores[@]}} ignored"
	echo "$success_msg"
	notify-send \
		--app-name="$UNMOUNT_APP_NAME" \
		--expire-time="$NOTIFICATION_EXPIRE_TIME_IN_MILISEC" \
		--urgency=normal \
		--wait \
		"$success_msg"

done
