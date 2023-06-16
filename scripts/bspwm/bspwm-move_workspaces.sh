#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
    exit 1
fi

for desktop in $(bspc query -D -m "$2"); do
    bspc desktop "$desktop" --to-monitor "$1"
done

