#!/bin/bash

optimus_nvidia="$(optimus-manager --status | grep 'Current GPU mode : nvidia')"
system76_nvidia="$(system76-power graphics | grep 'nvidia')"

# We need a compositor to avoid tearing, but picom and
# nvidia does not work well together, so we choose either.
if [ "$optimus_nvidia" ] || [ "$system76_nvidia" ]; then
    # Fix stutter caused by nvidia powermizer switching modes.
    # Lock it at highest mode.
    # Fix screen tearing by enabling composition pipeline.
    # Check status with: nvidia-settings -q CurrentMetaMode -t
    nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=1"

    # Only set CompositionPipeline if not already active.
    comp_pipeline="$(nvidia-settings -q CurrentMetaMode -t | grep 'ForceCompositionPipeline=On')"
    if [[ ! $comp_pipeline ]] && [[ ! $system76_nvidia ]]; then
        nvidia-settings -a CurrentMetaMode="nvidia-auto-select +0+0 { ForceCompositionPipeline = On }"
    fi

else
    picom -b --config $HOME/.config/picom.conf
fi
