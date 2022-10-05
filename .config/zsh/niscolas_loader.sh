#!/bin/bash

NISCOLAS_VARS=$HOME/.config/niscolas_vars.sh

if [ -f $NISCOLAS_VARS ]; then
    source $NISCOLAS_VARS
else
    source "$HOME/.config/zsh/niscolas_defaults.sh"
fi
