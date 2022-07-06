#!/bin/bash

if [ $@ == "br" ]; then
    setxkbmap br
    exit 0
elif [[ $@ == "us" ]]; then
    setxkbmap us
    exit 0
fi

echo "br"
echo "us"
