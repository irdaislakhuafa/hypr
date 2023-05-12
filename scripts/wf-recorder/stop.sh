source ~/.config/hypr/scripts/env.sh
kill -INT $(ps -a | grep wf-recorder | awk '{print$1}')
