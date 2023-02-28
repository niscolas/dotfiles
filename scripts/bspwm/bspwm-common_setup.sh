#!/usr/bin/env bash

setxkbmap us
setxkbmap -option "compose:menu"

$HOME/.config/polybar/launch.sh

feh --bg-scale $HOME/Pictures/wallpapers/gruvbox_skull.webp
