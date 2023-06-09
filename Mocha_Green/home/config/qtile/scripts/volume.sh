#!/bin/sh

auto_unmute() {
	mute_status=$(pulsemixer --get-mute)
	if [ "$mute_status" = "1" ]; then
 		pulsemixer --unmute
 	fi
}

handle_raise() {
	auto_unmute
	pulsemixer --change-volume +5
}

handle_lower() {
	auto_unmute
	pulsemixer --change-volume -5
}

case "$1" in
	-m) pulsemixer --toggle-mute;;
	-r) handle_raise;;
	-l) handle_lower;;
	*) exit 22;;
esac

exit 0
