#!/bin/sh
message='What do you want to do?'
questions=()
turn_screens_on='Turn dual screens on?'
turn_screens_off='Turn dual screens off?'
options="$
Turn dual screens off?"
echo $options
answer=`echo -e "$options" | ~/.config/i3/scripts/rofi.sh -dmenu -lines 2 -p "$message"`
echo $answer
