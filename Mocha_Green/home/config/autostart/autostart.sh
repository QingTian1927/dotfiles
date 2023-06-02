#!/bin/sh

"$HOME/.config/polybar/launch.sh" &
picom -b &
redshift &
xscreensaver --no-splash &
nitrogen --restore &

dunst &
pcmanfm -d &
/usr/lib/kdeconnectd &
kdeconnect-indicator &
#pnmixer &
