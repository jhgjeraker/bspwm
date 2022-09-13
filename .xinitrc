#!/bin/sh

if [[ -f /usr/bin/prime-offload ]]; then
    /usr/bin/prime-offload
fi

bspwm

if [[ -f /usr/bin/prime-switch ]]; then
    sudo /usr/bin/prime-switch
fi
