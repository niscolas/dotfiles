#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
    exit 1
fi

bspc monitor "$1" -d 1 2 3 4 5 6 7 8 9 10
bspc monitor "$2" -r
