#!/bin/sh
token=`cat ~/nextcloud-data/keys/slack-catawiki.key`
my_user_id=''
slack_bot_channel=''
my_im_channel=''

send_command(){
  curl 'https://slack.com/api/chat.command' -F token=$token -F channel=$slack_bot_channel -F as_user=my_user_id -F 'command=$1' -F text='$2'
}

dnd() {
  curl -s 'https://slack.com/api/dnd.setSnooze' -d "token=$token&num_minutes=$1" -o - | jq
}

active(){
  curl -s 'https://slack.com/api/dnd.endDnd' -d "token=$token" -o -
}

dnd_status(){
  curl -s 'https://slack.com/api/dnd.info' -d "token=$token" -o - | jq .snooze_enabled
}

pomodoro(){
  curl -s 'https://slack.com/api/users.profile.set' -H 'Content-type: application/json; charset=utf-8' -H "Authorization: Bearer $token" \
  -d '{"profile":{"status_text":"Busy","status_emoji":":tomato:","status_expiration":30m}}' -o - | jq
}

clear_status(){
  curl -s 'https://slack.com/api/users.profile.set' -H 'Content-type: application/json; charset=utf-8' -H "Authorization: Bearer $token" \
  -d '{"profile":{"status_text":"","status_emoji":""}}' -o - | jq
}

good_morning(){
  curl -s 'https://slack.com/api/chat.command' \
    -F token=$token \
    -F channel=$my_im_channel \
    -F command='/giphy' \
    -F text='#caption "Good morning nue-devs" good morning vietnam' \
    -F as_user=$my_user_id
}

draw_widget() {
  status=$(dnd_status)
  echo ''
  if [ "$status" = "false" ]; then
    echo '#00ff00'
  else
    echo '#ff0000'
  fi
}

if [ "$1" = "active" ]; then
  active
  py3-cmd refresh 'external_script slack'
elif [ "$1" = "dnd" ]; then
  dnd 30
  py3-cmd refresh 'external_script slack'
elif [ "$1" = "status" ]; then
  dnd_status
elif [ "$1" = "widget" ]; then
  draw_widget
elif [ "$1" = "good_morning" ]; then
  good_morning
  sleep 1
  dnd
elif [ "$1" = "clear" ]; then
  active
  sleep 1
  clear_status
fi
