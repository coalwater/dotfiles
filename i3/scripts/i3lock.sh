#!/bin/sh
notify-send 'DUNST_COMMAND_PAUSE' && \
  i3lock -n -c 111111 && \
  notify-send 'DUNST_COMMAND_RESUME'
