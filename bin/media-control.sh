#!/bin/bash

action=$1
amount=$2

sink=$(pactl info | grep "Default Sink" | sed -e "s/Default Sink: //")

if [[ $action = "increase" ]]; then
   pactl set-sink-volume $sink +$amount%
elif [[ $action = "decrease" ]]; then
   pactl set-sink-volume $sink -$amount%
else
    echo "Action $action not defined"
fi
