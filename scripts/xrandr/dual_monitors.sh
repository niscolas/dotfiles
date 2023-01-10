#!/usr/bin/env bash

internal_monitor=$(get_internal_monitor.sh)
hdmi_monitor=$(get_hdmi_monitor.sh)

if [[ -z $hdmi_monitor ]]; then
    exit
fi

if [[ -z $internal_monitor ]]; then
    exit
fi

xrandr --output $hdmi_monitor --primary --mode 1920x1080 --rate 144.0 --left-of \
    $internal_monitor --mode 1920x1080 --rate 144.0
