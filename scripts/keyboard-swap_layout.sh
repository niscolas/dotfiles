#!/usr/bin/env bash

layout=$(setxkbmap -query | grep layout: | awk '{ print $2 }')

if [ "$layout" == "br" ]; then
    newlayout="us"
elif [ "$layout" == "us" ]; then
    newlayout="br"
fi

notify-send "keyboard layout ($layout -> $newlayout)"
setxkbmap $newlayout
