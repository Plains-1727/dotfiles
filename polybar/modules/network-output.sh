#!/bin/bash

device=$(nmcli -t device | grep -w "connected" | cut -d ":" -f 1)

if [[ -z $device ]]; then
    zenity --error --title "Not Connected" --text "No network connection found!"
    exit
fi

interface=$(nmcli -t device show $device | grep DEVICE | cut -d ":" -f 2)
interface_type=$(nmcli -t device show $device | grep TYPE | cut -d ":" -f 2)
ip=$(nmcli -t device show $device | grep -m1 IP4.ADDRESS | cut -d ":" -f 2)
mac=$(nmcli -t device show $device | grep -Po "(?<=HWADDR:).*")

text="Interface:\t\t$interface\nType:\t\t\t$interface_type\nIP Address:\t$ip\nMAC Address:\t$mac"

zenity --info --title "Network Status" --text "$text"
