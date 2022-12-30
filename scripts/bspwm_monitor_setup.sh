#!/usr/bin/env bash

internal_monitor=$(get_internal_monitor.sh)
hdmi_monitor=$(get_hdmi_monitor.sh)

if [[ -n $internal_monitor && -n $hdmi_monitor ]]; then
    notify-send "dual monitors"
    dual_monitors.sh
    bspc monitor $hdmi_monitor -d 1 2 3 4 5
    bspc monitor $internal_monitor -d 6 7 8 9 10
elif [[ -n $internal_monitor && -z $hdmi_monitor ]]; then
    notify-send "internal only"
    internal_monitor_only.sh
    bspc monitor $internal_monitor -d 1 2 3 4 5 6 7 8 9 10
elif [[ -z $internal_monitor && -n $hdmi_monitor ]]; then
    notify-send "hdmi only"
    hdmi_monitor_only.sh
    bspc monitor $hdmi_monitor -d 1 2 3 4 5 6 7 8 9 10
fi
