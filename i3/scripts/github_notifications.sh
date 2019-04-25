#!/bin/sh
token=`cat ~/nextcloud-data/keys/github.token`
json=`curl -su coalwater:$token https://api.github.com/notifications`
reviews=`echo $json | jq '.[] | select(.reason == "review_requested") | .id' | wc -l`
notifications=`echo $json | jq 'length'`


echo " $reviews/$notifications"
if [ "$reviews" -gt 0 ]; then
  echo '#ff0000'
elif [ "$notifications" -gt 0 ]; then
  echo '#f38630'
else
  echo '#00ff00'
fi

