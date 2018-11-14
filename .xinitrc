#!/bin/sh

userresources=$HOME/.Xresources

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

export GDK_SCALE=2
feh --bg-fill /home/mohammad/Pictures/backgrounds/current.jpg
xrandr --dpi 150 --output eDP-1 --primary --mode 3200x1800 --pos 0x0 --rotate normal
exec i3
