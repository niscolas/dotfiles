#!/usr/bin/env bash

name="bspwm, hdmi_monitor_setup"

"$SCRIPTS_DIR/notify_script_start.sh" "$name"

hdmi_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_hdmi_monitor.sh")
internal_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_internal_monitor.sh")

"$SCRIPTS_DIR/notify_msg.sh" "$name" "monitor: $hdmi_monitor"
"$SCRIPTS_DIR/xrandr/xrandr-use_hdmi_monitor_only.sh"
"$SCRIPTS_DIR/bspwm/bspwm-move_desktops_to_monitor.sh" "$hdmi_monitor" "$internal_monitor"
"$SCRIPTS_DIR/bspwm/bspwm-use_workspaces_in_monitor.sh" "$hdmi_monitor" "$internal_monitor"

"$SCRIPTS_DIR/notify_script_success.sh" "$name"
