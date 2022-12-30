#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "no monitor name argument given, exiting"
    exit 2
fi

echo $(xrandr --listmonitors | grep $1 | awk '{print $4}')
