#!/bin/sh

userresources=$HOME/.Xresources

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

~/.config/i3/scripts/xautolock.sh &

export GDK_SCALE=2
export QT_SCALE_FACTOR=1.2
~/.fehbg
xrandr --dpi 320 --output eDP-1 --primary --mode 3200x1800 --pos 0x0 --rotate normal --primary

exec i3
