#!/bin/bash

msgId="472935"

function send_notification() {
	brightness="$(brightnessctl -q --device='smc::kbd_backlight' \
	       	| awk '{print $4}' | sed -n 2p | sed 's/^.//;s/.$//')"
	dunstify -a "Change backlight" -u low -i xfpm-brightness-keyboard -r "$msgId" \
		-h int:value:"$brightness" "Keyboard: ${brightness}" -t 2000
}

case $1 in
	up)
		brillo -k -A 5 -q
		send_notification $1
		;;
	down)
		brillo -k -U 5 -q
		send_notification $1
		;;
esac
