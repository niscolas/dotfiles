#!/bin/bash

if [[ $@ == "picom-start" ]]; then
    picom -b
    exit 0
elif [ $@ == "picom-stop" ]; then
    killall picom
    exit 0
elif [[ $@ == "keyd-start" ]]; then
    nohup systemctl start keyd
    exit 0
elif [[ $@ == "keyd-stop" ]]; then
    nohup systemctl stop keyd
    exit 0
fi

echo "picom-start"
echo "picom-stop"
echo "keyd-start"
echo "keyd-stop"
