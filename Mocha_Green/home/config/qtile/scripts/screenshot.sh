#!/usr/bin/env bash

SAVE_DIR="$HOME/Pictures/Screenshots/"

time=$(date +%Y-%m-%d_%H-%M-%S)
file_path="$SAVE_DIR/screenshot_$time"

shotgun -s "$file_path"

icon_path="/usr/share/icons/Papirus-Dark/16x16/actions/photo.svg"
summary="Screenshot saved"
body="Another shattered screen lied within $SAVE_DIR"
tag="string:x-dunst-stack-tag:screenshot"

dunstify -h "$tag" -i "$icon_path" -u "normal" -a "shotgun" "$summary" "$body"

exit 0
