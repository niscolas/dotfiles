#!/usr/bin/env bash

scripts_dir="$HOME/scripts/xrandr"

internal_monitor=$("$scripts_dir/get_internal_monitor.sh")
hdmi_monitor=$("$scripts_dir/get_hdmi_monitor.sh")

if [[ -n $internal_monitor && -n $hdmi_monitor ]]; then
    $scripts_dir/bspwm/bspwm-dual_monitors_setup.sh
elif [[ -n $internal_monitor && -z $hdmi_monitor ]]; then
    $scripts_dir/bspwm/bspwm-internal_monitor_setup.sh
elif [[ -z $internal_monitor && -n $hdmi_monitor ]]; then
    $scripts_dir/bspwm/bspwm-hdmi_monitor_setup.sh
fi
