#!/bin/sh
answer=`echo -e 'no\nyes' | ~/.config/i3/scripts/rofi.sh -dmenu -lines 2 -p "Turn screens off?"`
if [[ $answer == 'yes' ]]; then
  `~/.screenlayout/off.sh`
  `feh --bg-fill ~/Pictures/backgrounds/current.jpg`

else
  exit 0
fi

