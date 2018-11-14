#!/bin/sh
killall polybar
MONITOR=eDP-1 polybar top &
MONITOR=eDP-1 polybar bot &
MONITOR=DP-1-1 polybar top &
MONITOR=DP-1 polybar top &
MONITOR=DP-1-2 polybar workspaces &
