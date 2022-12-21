#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Run Applications as Root

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements
prompt='Applications'
mesg='Run Applications as Root'

if [[ "$theme" == *'type-1'* ]]; then
    list_col='1'
    list_row='6'
    win_width='400px'
elif [[ "$theme" == *'type-3'* ]]; then
    list_col='1'
    list_row='6'
    win_width='120px'
elif [[ "$theme" == *'type-5'* ]]; then
    list_col='1'
    list_row='6'
    win_width='520px'
elif [[ ( "$theme" == *'type-2'* ) || ( "$theme" == *'type-4'* ) ]]; then
    list_col='6'
    list_row='1'
    win_width='670px'
fi

# Options
layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
if [[ "$layout" == 'NO' ]]; then
    option_1=" keyd stop"
    option_2=" keyd start"
    option_3=" picom stop"
    option_4=" picom start"
    option_5=" barrier left right"
    option_6=" barrier up down"
else
    option_1=""
    option_2=""
    option_3=""
    option_4=""
    option_5=""
    option_6=""
fi

# Rofi CMD
rofi_cmd() {
    rofi -theme-str "window {width: $win_width;}" \
        -theme-str "listview {columns: $list_col; lines: $list_row;}" \
        -theme-str 'textbox-prompt-colon {str: "";}' \
        -dmenu \
        -p "$prompt" \
        -mesg "$mesg" \
        -markup-rows \
        -theme ${theme}
    }

# Pass variables to rofi dmenu
run_rofi() {
    echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

# Execute Command
run_cmd() {
    polkit_cmd="pkexec env PATH=$PATH DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY"
    if [[ "$1" == '--opt1' ]]; then
        ${polkit_cmd} systemctl stop keyd
    elif [[ "$1" == '--opt2' ]]; then
        ${polkit_cmd} systemctl start keyd
    elif [[ "$1" == '--opt3' ]]; then
        killall picom
    elif [[ "$1" == '--opt4' ]]; then
        picom
    elif [[ "$1" == '--opt5' ]]; then
        notify-send "5"
        kitty -e $HOME/scripts/barrier/work_server-left_right.sh
    elif [[ "$1" == '--opt6' ]]; then
        notify-send "6"
        kitty -e $HOME/scripts/barrier/work_server-up_down.sh
    fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
        notify-send "1"
        run_cmd --opt1
        ;;
    $option_2)
        run_cmd --opt2
        ;;
    $option_3)
        run_cmd --opt3
        ;;
    $option_4)
        run_cmd --opt4
        ;;
    $option_5)
        run_cmd --opt5
        ;;
    $option_6)
        run_cmd --opt6
        ;;
esac

