#!/bin/sh

get_metadata() {
	fmt_args='{{ title }} [{{ duration(position) }}/{{ duration(mpris:length) }}]'
	metadata=$(playerctl metadata --format "$fmt_args")
	echo "$metadata"
}

status=$(playerctl -s status)

case "$status" in
	Playing) message=" $(get_metadata)";;
	Paused) message=" $(get_metadata)";;
	*) echo '' && exit 0;;
esac

echo "$message" && exit 0
