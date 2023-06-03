#!/bin/sh

"$HOME/.config/polybar/launch.sh" &
picom -b &
redshift &
xscreensaver --no-splash &
nitrogen --restore &

dunst &
/usr/lib/kdeconnectd &
kdeconnect-indicator &

#pcmanfm -d &
#pnmixer &
