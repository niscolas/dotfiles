#!/bin/bash

killall -q polybar &

if type "xrandr"; then
  for m in $(xrandr --listmonitors | awk 'NR > 1 {print $4}'); do
    notify-send "loading $m"
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi
