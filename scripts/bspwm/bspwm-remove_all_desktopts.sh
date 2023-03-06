#!/usr/bin/env bash

# internal_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_internal_monitor.sh")
# hdmi_monitor=$("$SCRIPTS_DIR/xrandr/xrandr-get_hdmi_monitor.sh")

for desktop in $(bspc query -D)
do
    bspc monitor "$desktop" --remove
done
