#!/bin/sh
operation=("$@")
if [ "$operation" == "" ]; then
  curl -sLo /home/mohammad/Pictures/backgrounds/new.jpg https://source.unsplash.com/featured/3200x1800?wallpapers
  mv /home/mohammad/Pictures/backgrounds/new.jpg /home/mohammad/Pictures/backgrounds/current.jpg
  feh --bg-fill /home/mohammad/Pictures/backgrounds/current.jpg
else
  cp /home/mohammad/Pictures/backgrounds/current.jpg "/home/mohammad/Pictures/backgrounds/$(date +"%Y-%m-%d %H:%M:%S.jpg")"
fi
