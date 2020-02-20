#!/bin/sh
killall xautolock
xautolock \
  -time 5 \
  -locker "~/.config/i3/scripts/i3lock.sh" \
  -notify 30 \
  -notifier "notify-send -u low -t 10000 --app-name 'XAutoLock' 'Locking screen in 30 seconds'" 2>&1 > /dev/null &

