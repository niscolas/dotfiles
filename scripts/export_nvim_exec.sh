#!/usr/bin/env bash

nvim_exec="nvim"
if command -v bob &> /dev/null
then
    nvim_exec="$HOME/.local/share/bob/nvim-bin/nvim"
fi

if [ "$os_name" = "mac" ]; then
    export NVIM_EXEC="CC=/usr/local/Cellar/gcc/12.2.0/bin/gcc-12 $nvim_exec"
else
    export NVIM_EXEC="$nvim_exec"
fi
