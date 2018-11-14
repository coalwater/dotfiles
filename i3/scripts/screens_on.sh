#!/bin/sh
answer=`echo -e 'no\nyes' | ~/.config/i3/scripts/rofi.sh -dmenu -lines 2 -p "Turn screens on?"`
if [[ $answer == 'yes' ]]; then
  echo 'run xrandr'
  `~/.screenlayout/dual.sh`
  `feh --bg-fill ~/Pictures/backgrounds/current.jpg`
else
  echo 'exit'
  exit 0
fi

