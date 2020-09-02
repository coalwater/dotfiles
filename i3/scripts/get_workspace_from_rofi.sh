#!/bin/sh
selected_workspace=`i3-msg -t get_workspaces | jq -r '.[] | .name' | ~/.config/i3/scripts/rofi.sh -dmenu -p "$@"`
selected_workspace="${selected_workspace/firefox/}"
selected_workspace="${selected_workspace/github/}"
selected_workspace="${selected_workspace/jira/}"
selected_workspace="${selected_workspace/terminal/}"
selected_workspace="${selected_workspace/ruby/}"
selected_workspace="${selected_workspace/time/}"
selected_workspace="${selected_workspace/note/}"
selected_workspace="${selected_workspace/vim/}"
selected_workspace="${selected_workspace/vpn/旅}"
selected_workspace="${selected_workspace/android/}"
selected_workspace="${selected_workspace/apple/}"
selected_workspace="${selected_workspace/whatsapp/}"
selected_workspace="${selected_workspace/rocket/異}"
selected_workspace="${selected_workspace/gentoo/}"
selected_workspace="${selected_workspace/analytics/}"
selected_workspace="${selected_workspace/spotify/}"
selected_workspace="${selected_workspace/slack/}"
selected_workspace="${selected_workspace/env/}"
selected_workspace="${selected_workspace/markdown/}"
selected_workspace="${selected_workspace/ship/}"

echo -n $selected_workspace
