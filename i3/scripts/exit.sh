#!/bin/sh
answer=`echo -e 'no\nyes' | ~/.config/i3/scripts/rofi.sh -dmenu -lines 2 -p "Exit i3?"`
if [[ $answer == 'yes' ]]; then
  `i3-msg exit`
else
  exit 0
fi

