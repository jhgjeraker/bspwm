#!/bin/bash

_sort_desktops_per_monitor() {
    bspc query -M | while read -r monitor; do \
        bspc query -D -m "$monitor" --names | sort -g | xargs -rd'\n' bspc monitor "$monitor" -o; \
    done
}

_set_bspwm_config() {
    ## apply the bspwm configs except external_rules_command
    ## or the desktops will look funny if monitors have changed
    while read line ; do
        $line
    done < <(grep --color=never -E \
        '(split_ratio|border_width|window_gap|top_padding|bottom_padding|left_padding|right_padding)' ~/.config/bspwm/bspwmrc)
}

primary=$(xrandr | grep primary | cut -d ' ' -f 1)
monitors=($(xrandr --listactivemonitors|awk '{print $4}'|sed '/^$/d'))
n_monitors=${#monitors[@]}

# Create 1 placeholder desktop per monitor.
c=0
for monitor in "${monitors[@]}"; do
    bspc monitor "$monitor" -a $((99 - c))
    c=$((c+1))
done

n_desktops=10
# Move all desktops to primary monitor.
for desktop in $(bspc query --desktops --names); do
    bspc desktop "$desktop" -m "$primary"
done
# Move one desktop per monitor, starting from last.
c=0
for monitor in "${monitors[@]}"; do
    if [[ "$monitor" != "$primary" ]]; then
        bspc desktop $((n_desktops - c)) -m "$monitor"
        c=$((c+1))
    fi
done

_sort_desktops_per_monitor


c=$((n_desktops - n_monitors + 1 + 1))
for monitor in "${monitors[@]}"; do
    # Remove all desktops called `Desktop` before applying changes.
    for desktop in $(bspc query --desktops --names --monitor "$monitor"); do
        if [[ "$desktop" == "Desktop" ]]; then
            bspc desktop "$desktop" -r
        fi
    done

    if [[ "$monitor" == "$primary" ]]; then
        bspc monitor "$monitor" -d $(seq -s " " $((n_desktops - n_monitors + 1)))
    else
        bspc monitor "$monitor" -d "$c"
        c=$((c+1))
    fi
done

_set_bspwm_config
