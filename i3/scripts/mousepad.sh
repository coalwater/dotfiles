#!/bin/sh
on=`synclient -l | grep -ic touchpadoff.*=.*0`
if [ "$on" == "0" ]; then
  echo 'ﳶ off'
  echo '#ff0000'
else
  echo 'ﳶ on'
  echo '#00ff00'
fi

