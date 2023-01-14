#!/usr/bin/env bash

scripts_dir="$HOME/scripts"
internal_monitor=$("$scripts_dir/xrandr/xrandr-get_internal_monitor.sh")
hdmi_monitor=$("$scripts_dir/xrandr/xrandr-get_hdmi_monitor.sh")

notify-send "dual monitors"
notify-send $internal_monitor
notify-send $hdmi_monitor
$scripts_dir/xrandr/xrandr-use_dual_monitors.sh
bspc monitor $hdmi_monitor -d 1 2 3 4 5
bspc monitor $internal_monitor -d 6 7 8 9 10
