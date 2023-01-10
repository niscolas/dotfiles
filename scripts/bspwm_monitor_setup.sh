#!/usr/bin/env bash

scripts_dir="$HOME/scripts/xrandr"

internal_monitor=$("$scripts_dir/get_internal_monitor.sh")
hdmi_monitor=$("$scripts_dir/get_hdmi_monitor.sh")

if [[ -n $internal_monitor && -n $hdmi_monitor ]]; then
    notify-send "dual monitors"
    $scripts_dir/dual_monitors.sh
    bspc monitor $hdmi_monitor -d 1 2 3 4 5
    bspc monitor $internal_monitor -d 6 7 8 9 10
elif [[ -n $internal_monitor && -z $hdmi_monitor ]]; then
    notify-send "internal only"
    $scripts_dir/internal_monitor_only.sh
    bspc monitor $internal_monitor -d 1 2 3 4 5 6 7 8 9 10
elif [[ -z $internal_monitor && -n $hdmi_monitor ]]; then
    notify-send "hdmi only"
    $scripts_dir/hdmi_monitor_only.sh
    bspc monitor $hdmi_monitor -d 1 2 3 4 5 6 7 8 9 10
fi
