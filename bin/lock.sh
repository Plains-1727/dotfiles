#!/bin/bash

HEIGHT=$(xwininfo -root | grep Height | grep -o -E '[0-9]+')
WIDTH=$(xwininfo -root | grep Width | grep -o -E '[0-9]+')
POSX=$(expr $WIDTH - 100)
POSY=$(expr $HEIGHT - 100)

#WALLPAPER=$(cat .fehbg | awk -F "\'" '{print $2}' | xargs)
WALLPAPER=/home/jan/Pictures/Wallpaper/blurred-red-moon.png


i3lock -e \
    --clock \
    -i $WALLPAPER \
    -F \
    --force-clock \
    --indicator \
    --radius 20 \
    --ring-width 4 \
    --ring-color=e1e3e4 \
    --keyhl-color=9ed06c \
    --inside-color=00000000 \
    --time-color=ffffff \
    --date-color=ffffff \
    --greeter-color=ffffff \
    --line-color=00000000 \
    --insidewrong-color=00000000 \
    --ringver-color=bb97ee \
    --ringwrong-color=fb617e \
    --insidever-color=00000000 \
    --separator-color=00000000 \
    --time-align 1 \
    --date-align 1 \
    --time-pos=100:$POSY \
    --ind-pos=360:$(expr $POSY - 15) \
    --greeter-pos=155:$(expr $POSY + 55) \
    --verif-text="" \
    --wrong-text="" \
    --noinput-text="" \
    --greeter-text="Type to unlock..." \
    --time-size=50 \
    --date-size=20 \
    --greeter-size=15 \
