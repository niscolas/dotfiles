#!/bin/bash

power_off='⏻'
reboot=''
suspend='鈴'
log_out=''

chosen=$(printf '%s;%s;%s;%s\n' "$power_off" "$reboot" "$suspend" "$log_out" \
    | rofi -theme-str '@import "power.rasi"' \
           -dmenu \
           -sep ';')

case "$chosen" in
    "$power_off")
        poweroff
        ;;

    "$reboot")
        reboot
        ;;

    "$suspend")
        systemctl suspend
        ;;

    "$log_out")
        pkill -u ${USER}
        ;;

    *) exit 1 ;;
esac
