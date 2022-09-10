#!/bin/bash

msgId="355610"

function send_notification() {
	brightness=$(printf "%.0f\n" $(brillo -G))
	#brightness="$(xbacklight -get | awk -F "." '{print $1}')"
	dunstify -a "Change brightness" -u low -i xfpm-brightness-lcd -r "$msgId" \
		-h int:value:"$brightness" "Brightness: ${brightness}%" -t 2000
}

case $1 in
	up)
		brillo -A 5 -q
		send_notification $1
		;;
	down)
		brillo -U 5 -q
		send_notification $1
		;;
esac
