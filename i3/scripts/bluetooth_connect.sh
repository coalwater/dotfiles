#!/bin/bash
echo 'info' | bluetoothctl | grep 'Headset'
if [ $? -ne 0 ]; then
  echo 'connect XX:XX:XX:XX:XX:XX' | bluetoothctl
else
  answer=`echo -e 'no\nyes' | ~/.config/i3/scripts/rofi.sh -dmenu -lines 2 -p "Disconnect bluetooth headset?"`
  if [[ $answer == 'yes' ]]; then
    echo 'disconnect' | bluetoothctl
  fi
fi
