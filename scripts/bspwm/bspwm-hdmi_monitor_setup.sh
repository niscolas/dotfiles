#!/usr/bin/env bash

scripts_dir="$HOME/scripts"
hdmi_monitor=$("$scripts_dir/xrandr/xrandr-get_hdmi_monitor.sh")

notify-send "hdmi only"
$scripts_dir/xrandr/xrandr-use_hdmi_monitor_only.sh
bspc monitor $hdmi_monitor -d 1 2 3 4 5 6 7 8 9 10
