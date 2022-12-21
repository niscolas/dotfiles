#!/bin/bash

zi_home_path="$ZI_HOME/bin/zi.zsh"
if ! [ -f  $zi_home_path ]; then
    exit 2
fi

source $zi_home_path  

zi ice wait
zi load "zsh-users/zsh-autosuggestions"
zi load "zsh-users/zsh-syntax-highlighting"
