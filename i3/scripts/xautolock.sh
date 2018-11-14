#!/bin/sh
killall xautolock
xautolock -detectsleep \
  -time 5 \
  -locker "i3lock -d -c 111111" \
  -notify 30 \
  -notifier "notify-send -u low -t 10000 --app-name 'XAutoLock' 'Locking screen in 30 seconds'"

