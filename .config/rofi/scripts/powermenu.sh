#!/bin/bash

if [ $@ == "shutdown" ]; then
    poweroff
    exit 0
elif [[ $@ == "restart" ]]; then
    reboot
    exit 0
elif [[ $@ == "logout" ]]; then
    pkill -u niscolas
    exit 0
elif [[ $@ == "lock" ]]; then
    exit 0
elif [[ $@ == "suspend" ]]; then
    systemctl suspend
    exit 0
fi

echo "shutdown"
echo "restart"
echo "logout"
echo "lock"
echo "suspend"
