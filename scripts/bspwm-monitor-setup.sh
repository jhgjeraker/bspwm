#!/bin/bash

_desk_order() {
    while read -r line; do
        printf "%s\\n" "$line"
    done < <(bspc query -D -m "${1:-focused}" --names) | sort -g | paste -d ' ' -s
}

_set_bspwm_config() {
    ## apply the bspwm configs escept external_rules_command
    ## or the desktops will look funny if monitors have changed
    while read line ; do
        $line
    done < <(grep --color=never -E \
        '(split_ratio|border_width|window_gap|top_padding|bottom_padding|left_padding|right_padding)' ~/.config/bspwm/bspwmrc)
}

PRIMARY_MONITOR=$(xrandr | grep primary | cut -d ' ' -f 1)
OUTPUTS=($(xrandr --listactivemonitors|awk '{print $4}'|sed '/^$/d'))
NB_OF_MONITORS=${#OUTPUTS[@]}

for MONITOR in ${OUTPUTS[@]}; do
    bspc monitor $MONITOR -d 1 2 3 4 5 6 7 8 9 10

    ## reorder the desktops for each monitor
    bspc monitor $MONITOR -o $(eval _desk_order $MONITOR)
done

_set_bspwm_config
