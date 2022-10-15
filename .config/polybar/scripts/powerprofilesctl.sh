#!/bin/bash

mode=$(powerprofilesctl list | grep '*')

if [ "${mode}" == '* performance:' ]; then
    echo 'hi'
elif [ "${mode}" == '* balanced:' ]; then
    echo 'bl'
elif [ "${mode}" == '* power-saver:' ]; then
    echo 'lo'
else
    echo ' ?'
fi
