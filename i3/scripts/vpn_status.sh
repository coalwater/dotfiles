#!/bin/sh
vpn_running=$(pgrep -x openvpn)
if [[ -n $vpn_running ]]; then
  echo "%{u#77ff77}旅 On%{u-}"
else
  echo "%{u#bb8888}旅 Off%{u-}"
fi
