#!/bin/bash

interface=$(nmcli -t device | grep -w "connected" | cut -d ":" -f 2)

if [[ -z $interface ]]; then
    echo 
    exit
fi

if [ $interface = "ethernet" ]; then
    echo 
elif [ $interface = "wifi" ]; then
    echo 直
fi

