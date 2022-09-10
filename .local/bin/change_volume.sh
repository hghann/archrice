#!/bin/bash

msgId="991049"

function send_notification() {
	volume="$(amixer get Master | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g')"
	mute="$(amixer get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
	dunstify -a "Change volume" -u low -i audio-volume-high -r "$msgId" \
		-h int:value:"$volume" "Volume: ${volume}%" -t 2000
}

case $1 in
	up)
		amixer -q sset Master unmute
		amixer -q sset Master 5%+
		kill -44 $(pidof dwmblocks)
		send_notification $1
		;;
	down)
		amixer -q sset Master unmute
		amixer -q sset Master 5%-
		kill -44 $(pidof dwmblocks)
		send_notification $1
		;;
	mute)
		amixer -q sset Master toggle
		if [[ $(amixer get Master | tail -1 | awk '{print $6}') == "[off]" ]]; then
			dunstify -a "Change volume" -u low -i audio-volume-muted -r "$msgId" "Volume muted"
		else
			send_notification $1
		fi
		;;
esac
