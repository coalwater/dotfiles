#!/bin/bash
total=`curl -sH "Authorization: Basic XXXXXXXX" "https://jira.XXXXXX.net/rest/api/latest/search?jql=x=y" | jq '.total'`
echo $total
if [ "$total" -gt "0" ]; then
  echo "#FF0000"
fi
