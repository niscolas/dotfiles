#!/usr/bin/env bash

name="bspwm, internal_monitor_setup"

"$SCRIPTS_DIR/notify_script_start.sh" "$name"

internal_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_internal_monitor.sh")

"$SCRIPTS_DIR/notify_msg.sh" "$name" "monitor: $internal_monitor"
"$SCRIPTS_DIR/xrandr/xrandr-use_internal_monitor_only.sh"

hdmi_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_hdmi_monitor.sh")
if [[ -n "$hdmi_monitor" ]]; then
    bspc monitor "$hdmi_monitor" -r
fi

bspc monitor "$internal_monitor" -d 1 2 3 4 5 6 7 8 9 10

"$SCRIPTS_DIR/notify_script_success.sh" "$name"
