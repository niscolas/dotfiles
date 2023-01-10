#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "no monitor name argument given, exiting"
    exit 2
fi

echo $(xrandr | grep $1 | grep ' connected' | awk '{print $1}')
