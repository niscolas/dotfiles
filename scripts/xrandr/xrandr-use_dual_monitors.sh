#!/usr/bin/env bash

internal_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_internal_monitor.sh")
hdmi_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_hdmi_monitor.sh")

if [[ -z "$hdmi_monitor" || -z "$internal_monitor" ]]; then
    exit
fi

xrandr --output "$hdmi_monitor" --primary --mode 1920x1080 --rate 144.0 --pos 0x0 \
    --output "$internal_monitor" --mode 1920x1080 --pos 1920x0 --rate 144.0
