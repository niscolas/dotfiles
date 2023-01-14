#!/usr/bin/env bash

internal_monitor=$(xrandr-get_internal_monitor.sh)
if [[ -z $internal_monitor ]]; then
    exit
fi

xrandr --output $internal_monitor --primary --mode 1920x1080 --rate 144.0
