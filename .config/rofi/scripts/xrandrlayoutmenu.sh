#!/bin/bash

if [ $@ == "default" ]; then
    xrandr --output HDMI-0 --primary --mode 1920x1080 --rate 120 --left-of eDP-1-1 \
            --output eDP-1-1 --mode 1920x1080
    exit 0
elif [[ $@ == "hdmi-only" ]]; then
    xrandr --output HDMI-0 --primary --mode 1920x1080 --rate 120 \
            --output eDP-1-1 --off
    exit 0
elif [[ $@ == "internal-only" ]]; then
    xrandr --output eDP-1-1 --primary --mode 1920x1080 --rate 60 \
            --output HDMI-0 --off
            
    exit 0
fi

echo "default"
echo "hdmi-only"
echo "internal-only"
