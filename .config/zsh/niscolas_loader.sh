#!/bin/bash

if [[ -z $NISCOLAS_SETUP ]]; then
    default_value="personal"
    echo "NISCOLAS_SETUP is undefined, setting default: $default_value"
    export NISCOLAS_SETUP=$default_value
fi

if [[ -z $NISCOLAS_THEME ]]; then
    default_value="gruvbox"
    echo "NISCOLAS_THEME is undefined, setting default: $default_value"
    export NISCOLAS_THEME=$default_value
fi
