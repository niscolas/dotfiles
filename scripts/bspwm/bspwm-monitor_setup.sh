#!/usr/bin/env bash

name="bspwm, monitor_setup"

"$SCRIPTS_DIR/notify_script_start.sh" "$name"

internal_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_internal_monitor.sh")
hdmi_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_hdmi_monitor.sh")

if [[ -n "$internal_monitor" && -n "$hdmi_monitor" ]]; then
    "$SCRIPTS_DIR/bspwm/bspwm-dual_monitors_setup.sh"
elif [[ -n $internal_monitor ]]; then
    "$SCRIPTS_DIR/bspwm/bspwm-internal_monitor_setup.sh"
elif [[ -n $hdmi_monitor ]]; then
    "$SCRIPTS_DIR/bspwm/bspwm-hdmi_monitor_setup.sh"
fi

"$SCRIPTS_DIR/notify_script_success.sh" "$name"
