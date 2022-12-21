#!/bin/bash

if [ "$os_name" = "mac" ]; then
    export NVIM_EXEC="CC=/usr/local/Cellar/gcc/12.2.0/bin/gcc-12 nvim"
else
    export NVIM_EXEC="nvim"
fi
