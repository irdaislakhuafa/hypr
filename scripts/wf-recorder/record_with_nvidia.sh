source ~/.config/hypr/scripts/env.sh

ENCODING="h264_nvenc"

# send notification
notify-send \
	--app-name="$SCREEN_RECORDER_APP_NAME" \
	--expire-time="$NOTIFICATION_EXPIRE_TIME_IN_MILISEC" \
	--urgency=normal \
	--wait \
	"Starting record screen (NVIDIA GPU - $ENCODING)"


# record screen
wf-recorder \
	-p $ENCODING \
	-d /dev/dri/card1 \
	-f $RECORD_SCREEN_DESTINATION $@
