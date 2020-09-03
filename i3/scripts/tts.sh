#!/bin/sh
read text
echo $text |\
  sed 's/“/"/g' |\
  sed 's/”/"/g' |\
  sed 's/—/ /g' |\
  sed "s/’/'/g" |\
  festival --tts --pipe

