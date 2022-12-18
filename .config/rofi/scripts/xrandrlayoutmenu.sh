#!/bin/bash

if [ $@ == "extend-120" ]; then
    xrandr --output HDMI-1-0 --primary --mode 1920x1080 --rate 120 --left-of eDP-1 \
            --output eDP-1 --mode 1920x1080
    exit 0
elif [ $@ == "extend-60" ]; then
    xrandr --output HDMI-1-0 --primary --mode 1920x1080 --rate 60 --left-of eDP-1 \
            --output eDP-1 --mode 1920x1080
    exit 0
elif [ $@ == "dual-120" ]; then
    xrandr --output HDMI-1-0 --primary --mode 1920x1080 --rate 120 --output eDP-1 --mode 1920x1080 --rate 60
    exit 0
elif [ $@ == "dual-60" ]; then
    xrandr --output HDMI-1-0 --primary --mode 1920x1080 --rate 60 --output eDP-1 --mode 1920x1080 --rate 60
    exit 0
elif [[ $@ == "hdmi-120" ]]; then
    xrandr --output HDMI-1-0 --primary --mode 1920x1080 --rate 120 \
            --output eDP-1 --off
    exit 0
elif [[ $@ == "hdmi-60" ]]; then
    xrandr --output HDMI-1-0 --primary --mode 1920x1080 --rate 60 \
            --output eDP-1 --off
    exit 0
elif [[ $@ == "internal" ]]; then
    xrandr --output eDP-1 --primary --mode 1920x1080 \
            --output HDMI-1-0 --off
            
    exit 0
fi

echo "internal"
echo "extend-120"
echo "extend-60"
echo "dual-120"
echo "dual-60"
echo "hdmi-120"
echo "hdmi-60"
