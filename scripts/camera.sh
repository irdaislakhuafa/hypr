#!/usr/bin/sh
mpv /dev/video0 \
	--no-audio \
	--window-scale=0.5 \
	--vf=hflip \
	--profile=low-latency \
	--untimed \
	--opengl-glfinish=yes \
	--fps=60 \
	--framedrop=no \
	--speed=1.01 \
	--opengl-swapinterval=0 \
	--no-correct-pts 
