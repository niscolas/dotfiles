#!/usr/bin/env bash

name="bspwm, hdmi_monitor_setup"

"$SCRIPTS_DIR/notify_script_start.sh" "$name"

hdmi_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_hdmi_monitor.sh")

"$SCRIPTS_DIR/notify_msg.sh" "$name" "monitor: $hdmi_monitor"
"$SCRIPTS_DIR/xrandr/xrandr-use_hdmi_monitor_only.sh"

internal_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_internal_monitor.sh")
if [[ -n "$internal_monitor" ]]; then
    bspc monitor "$internal_monitor" -r
fi

bspc monitor "$hdmi_monitor" -d 1 2 3 4 5 6 7 8 9 10

"$SCRIPTS_DIR/notify_script_success.sh" "$name"
