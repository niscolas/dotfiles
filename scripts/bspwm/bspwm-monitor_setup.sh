#!/usr/bin/env bash

scripts_dir=$HOME/scripts
internal_monitor=$($scripts_dir/xrandr/xrandr-get_internal_monitor.sh)
hdmi_monitor=$($scripts_dir/xrandr/xrandr-get_hdmi_monitor.sh)

if [[ -n $internal_monitor && -n $hdmi_monitor ]]; then
    $scripts_dir/xrandr/xrandr-use_dual_monitors.sh
    bspc monitor $hdmi_monitor -d 1 2 3 4 5
    bspc monitor $internal_monitor -d 6 7 8 9 10
elif [[ -n $internal_monitor ]]; then
    $scripts_dir/xrandr/xrandr-use_internal_monitor_only.sh
    bspc monitor $internal_monitor -d 1 2 3 4 5 6 7 8 9 10
elif [[ -n $hdmi_monitor ]]; then
    $scripts_dir/xrandr/xrandr-use_hdmi_monitor_only.sh
    bspc monitor $hdmi_monitor -d 1 2 3 4 5 6 7 8 9 10 &
fi
