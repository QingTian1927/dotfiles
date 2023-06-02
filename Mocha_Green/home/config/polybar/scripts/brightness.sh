#!/bin/sh

now="$(brightnessctl g)"
max="$(brightnessctl m)"
per="$((200 * $now/$max - 100 * $now/$max))%"

echo "$per"
