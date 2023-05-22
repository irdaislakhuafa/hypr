SSID="Dark Developer"
PASSWORD="darkdeveloper"
CONNECTION_NAME="Hotspot"
ACTION="$1"

source ~/.config/hypr/scripts/env.sh
APP_NAME="Wifi Hotspot"

if [ "$ACTION" = "up" ]; then
	notify-send \
		--app-name="$APP_NAME" \
		--expire-time="$NOTIFICATION_EXPIRE_TIME_IN_MILISEC" \
		--urgency=normal \
		--wait \
		"Starting hotspot wifi $SSID";
	
	nmcli dev wifi hotspot \
		ssid "$SSID" \
		password "$PASSWORD" \
		con-name "$CONNECTION_NAME";
elif [ "$ACTION" = "down" ]; then
	notify-send \
		--app-name="$APP_NAME" \
		--expire-time="$NOTIFICATION_EXPIRE_TIME_IN_MILISEC" \
		--urgency=normal \
		--wait \
		"Stoping hotspot wifi $SSID";

	nmcli connection down "$CONNECTION_NAME";
elif [ "$ACTION" = "show" ]; then
	nmcli dev wifi show-password | rofi -dmenu
elif [ "$ACTION" = "" ]; then
	msg="Action required up/down/show";
	notify-send \
		--app-name="$APP_NAME" \
		--expire-time="$NOTIFICATION_EXPIRE_TIME_IN_MILISEC" \
		--urgency=normal \
		--wait \
		"$msg";
	echo "$msg"
else 
	msg="Unavailable action $ACTION";
	notify-send \
		--app-name="$APP_NAME" \
		--expire-time="$NOTIFICATION_EXPIRE_TIME_IN_MILISEC" \
		--urgency=normal \
		--wait \
		"$msg";

	echo "$msg";
fi
