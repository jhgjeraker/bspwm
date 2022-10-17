#!/bin/bash

# We need a compositor to avoid tearing, but picom and
# nvidia does not work well together, so we choose either.
if optimus-manager --status | grep 'Current GPU mode : nvidia'; then
    # Fix stutter caused by nvidia powermizer switching modes.
    # Lock it at highest mode.
    # Fix screen tearing by enabling composition pipeline.
    # Check status with: nvidia-settings -q CurrentMetaMode -t
    nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=1"

    # Only set CompositionPipeline if not already active.
    if ! nvidia-settings -q CurrentMetaMode -t | grep 'ForceCompositionPipeline=On'; then
        nvidia-settings -a CurrentMetaMode="nvidia-auto-select +0+0 { ForceCompositionPipeline = On }"
    fi

else
    picom -b --config $HOME/.config/picom.conf
fi
