#!/bin/sh
token=`cat ~/nextcloud-data/keys/github.token`
json=`curl -su coalwater:$token https://api.github.com/orgs/catawiki/issues`
echo $json | jq
