#!/bin/sh
sinks = pactl list sinks | pcregrep -M -o1 -o2 -o3 --om-separator ':' '(?:^Sink #(\d*).*(?:\n|.)*?Name: ([^\.]*).*\.*.*(?:\n|.)*?Volume.*(?<=\s)(\d*)%.*)*'
