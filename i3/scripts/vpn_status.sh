#!/bin/sh
vpn_running=$(pgrep -x openvpn)
if [[ -n $vpn_running ]]; then
  echo "旅 On"
  echo '#00FF00'
else
  echo "旅 Off"
  echo '#FF0000'
fi
