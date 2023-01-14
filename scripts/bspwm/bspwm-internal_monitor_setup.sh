#!/usr/bin/env bash

scripts_dir="$HOME/scripts"
internal_monitor=$("$scripts_dir/xrandr/xrandr-get_internal_monitor.sh")

notify-send "internal only"
$scripts_dir/xrandr/xrandr-use_internal_monitor_only.sh
bspc monitor $internal_monitor -d 1 2 3 4 5 6 7 8 9 10
