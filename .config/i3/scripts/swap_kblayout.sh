#!/bin/bash

layout=$(setxkbmap -query | grep layout: | awk '{ print $2 }')

if [ "$layout" == "br" ]; then
    setxkbmap us
elif [ "$layout" == "us" ]; then
    setxkbmap br
fi
