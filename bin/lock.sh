#!/bin/bash
resloution_primary_screen=$(xrandr | grep primary | grep -Eo "[0-9]{1,4}x[0-9]{1,4}\+[0-9]{1,4}")
width=$(echo $resloution_primary_screen | grep -Eo "^[0-9]{1,4}")
height=$(echo $resloution_primary_screen | grep -Po  "(?<=x)[0-9]{1,4}")
offset=$(echo $resloution_primary_screen | grep -Po "(?<=\+)[0-9]{1,4}")

time_pos=$(expr $offset + 100):$(expr $height - 100)
ind_pos=$(expr $offset + 360):$(expr $height - 116)
greeter_pos=$(expr $offset + 155):$(expr $height - 45)

wallpaper=/home/jan/Pictures/Wallpaper/walchensee-blur.jpg

radius=20
ring_width=4
ring_color=00000000
ringver_color=6cb6eb
ringwrong_color=ec7279
keyhl_color=d38aea
fg_color=c5cdd9
lock_icon=

i3lock -e \
    --clock \
    -i $wallpaper \
    -F \
    --force-clock \
    --radius $radius \
    --ring-width $ring_width \
    --ring-color=$ring_color \
    --keyhl-color=$keyhl_color \
    --inside-color=00000000 \
    --time-color=$fg_color \
    --date-color=$fg_color \
    --greeter-color=fg_color \
    --line-color=00000000 \
    --insidewrong-color=00000000 \
    --ringver-color=$ringver_color \
    --ringwrong-color=$ringwrong_color \
    --insidever-color=00000000 \
    --separator-color=00000000 \
    --time-align 1 \
    --date-align 1 \
    --time-pos=$time_pos \
    --ind-pos=$ind_pos \
    --greeter-pos=$greeter_pos \
    --verif-text="" \
    --wrong-text="" \
    --noinput-text="" \
    --greeter-text=$lock_icon \
    --time-size=50 \
    --date-size=20 \
    --greeter-size=15
