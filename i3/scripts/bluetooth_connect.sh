#!/bin/bash
echo 'info' | bluetoothctl | grep 'Headset'
if [ $? -ne 0 ]; then
  echo 'connect XX:XX:XX:XX:XX:XX' | bluetoothctl
else
  echo 'disconnect' | bluetoothctl
fi
