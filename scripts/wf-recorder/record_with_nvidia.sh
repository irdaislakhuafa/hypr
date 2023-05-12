source ~/.config/hypr/scripts/env.sh
wf-recorder -p h264_nvenc -d /dev/dri/card1 -f $RECORD_SCREEN_DESTINATION $@
