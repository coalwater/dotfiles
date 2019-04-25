#!/bin/sh
vboxmanage list runningvms | cut -d'"' -f2
