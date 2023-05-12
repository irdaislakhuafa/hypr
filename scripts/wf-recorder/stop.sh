source ~/.config/hypr/scripts/env.sh

RECORDING_PROCESS_ID="$(ps -a | grep wf-recorder | awk '{print$1}')"

if [ "$RECORDING_PROCESS_ID" = "" ]; then
	notify-send \
		--app-name="$SCREEN_RECORDER_APP_NAME" \
		--expire-time="$NOTIFICATION_EXPIRE_TIME_IN_MILISEC" \
		--urgency=normal \
		--wait \
		"Your screen not in recording"
	exit 0
fi

result="$(kill -INT $RECORDING_PROCESS_ID)"
if [ "$result" = "" ]; then
	notify-send \
		--app-name="$SCREEN_RECORDER_APP_NAME" \
		--expire-time="$NOTIFICATION_EXPIRE_TIME_IN_MILISEC" \
		--urgency=normal \
		--wait \
		"Record screen are stoped!"
fi
