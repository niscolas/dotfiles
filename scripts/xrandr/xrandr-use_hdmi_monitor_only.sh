#!/usr/bin/env bash

hdmi_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_hdmi_monitor.sh")
internal_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_internal_monitor.sh")

if [[ -z "$hdmi_monitor" ]]; then
    exit
fi

xrandr --output "$hdmi_monitor" --primary --mode 1920x1080 --rate 144.0 \
       --output "$internal_monitor" --off
