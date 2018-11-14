#!/bin/sh
current_brightness=`light -G`
max_brightness=`light -Gm`
min_brightness=`light -Gc`
bstep=$@
brightness=$((current_brightness+=bstep))
if [$brightness > $max_brightness]; then
  brightness= 100
elif [$brightness < $min_brightness]; then
  brightness= 0
fi

light -S brightness
