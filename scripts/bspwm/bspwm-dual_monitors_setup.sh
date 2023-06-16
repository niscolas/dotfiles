#!/usr/bin/env bash

name="bspwm, dual_monitors_setup"

"$SCRIPTS_DIR/notify_script_start.sh" "$name"

internal_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_internal_monitor.sh")
hdmi_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_hdmi_monitor.sh")

"$SCRIPTS_DIR/notify_msg.sh" "$name" "(internal: $internal_monitor, HDMI: $hdmi_monitor)"

"$SCRIPTS_DIR/xrandr/xrandr-use_dual_monitors.sh"
bspc monitor "$hdmi_monitor" -d 1 2 3 4 5
bspc monitor "$internal_monitor" -d 6 7 8 9 10
bspc wm -O "$hdmi_monitor" "$internal_monitor"

"$SCRIPTS_DIR/notify_script_success.sh" "$name"
