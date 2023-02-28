#!/usr/bin/env bash

killall polybar

if type "xrandr"; then
  for m in $(xrandr --listmonitors | awk 'NR > 1 {print $4}'); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi
