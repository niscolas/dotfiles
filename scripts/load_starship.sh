#!/bin/zsh

if [ "$os_name" != "mac" ]; then
    prompt off
fi

eval "$(starship init zsh)"

