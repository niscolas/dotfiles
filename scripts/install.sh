#!/usr/bin/env bash

cargo_pkgs=(
    exa
    mprocs
    starship
    ripgrep
    nu --all-features
    zoxide
    )

mkdir "$HOME/.cache/X11"
echo 'export ERRFILE="$HOME/.cache/X11/xsession-errors"' | sudo tee -a /etc/profile
