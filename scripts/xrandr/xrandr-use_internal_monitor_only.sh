#!/usr/bin/env bash

internal_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_internal_monitor.sh")

if [[ -z "$internal_monitor" ]]; then
    exit
fi

hdmi_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_hdmi_monitor.sh")

if [[ -z "$hdmi_monitor" ]]; then
    xrandr --output "$internal_monitor" --primary --mode 1920x1080 --rate 144.0
else
    xrandr --output "$internal_monitor" --primary --mode 1920x1080 --rate 144.0 \
        --output "$hdmi_monitor" --off
fi

