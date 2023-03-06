#!/usr/bin/env bash

name="bspwm, common_setup"
"$SCRIPTS_DIR/notify_script_start.sh" "$name"

setxkbmap us
setxkbmap -option "compose:menu"

"$HOME/.config/polybar/launch.sh"

feh --no-fehbg --bg-scale "$HOME/Pictures/wallpapers/gruvbox_skull.webp"

"$SCRIPTS_DIR/notify_script_success.sh" "$name"
