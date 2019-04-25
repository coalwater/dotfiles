#!/bin/sh
s=`~/.config/i3/scripts/gcp.sh --status`

echo " $(echo $s | sed "s/\"//g" | sed "s/\(.\)\(.*\)/\U\1\L\2/g")"
if [ "$s" == "\"RUNNING\"" ]; then
  echo "#ff0000"
else
  echo "#00ff00"
fi
