#!/usr/bin/env bash

#todo: setup dotfiles

arch_pkgs=(
    keyd
    kitty
    wired
)

cargo_pkgs=(
    bat
    bob-nvim
    delta
    dust
    exa
    just
    mprocs
    # ncspot
    nu --all-features
    ripgrep
    speedtest-rs
    starship
    zoxide
)

config_dir="$HOME/.config"

bob-nvim install nightly

rm -rf "/etc/keyd"
ln -s "$config_dir/keyd" "/etc/keyd"

mkdir "$HOME/.cache/X11"
echo 'export ERRFILE="$HOME/.cache/X11/xsession-errors"' | sudo tee -a /etc/profile
