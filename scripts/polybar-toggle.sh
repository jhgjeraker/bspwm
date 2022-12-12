#!/bin/sh

state_hide='hide'
state_show='show'

statefile='/tmp/polybar-toggle-state'

bar_hide(){
    polybar-msg cmd hide
    bspc config top_padding 0
}

bar_show(){
    polybar-msg cmd show
    bspc config top_padding 25
}

# Declare out string variable.
declare current_state

# Source the state file.
if [ -f "$statefile" ]; then
    source "$statefile" 2>/dev/null
else
    current_state="$state_show"
fi

if [ "$current_state" = "$state_hide" ]; then
    bar_show
    current_state="$state_show"
elif [ "$current_state" = "$state_show" ]; then
    bar_hide
    current_state="$state_hide"
else
    echo "unknown state $current_state"
fi

# Persist to file.
declare -p current_state > "$statefile"
