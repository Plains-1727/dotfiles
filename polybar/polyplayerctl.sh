#! /bin/bash

if ! playerctl status -s > /dev/null
then
    echo "No active players"
    exit
fi

if [[ $(playerctl status -s) = *Stopped* ]]
then
    echo "Stopped"
    exit
fi

artist=$(playerctl metadata artist -s)
title=$(playerctl metadata title -s)

title_length=$(echo -n $title | wc -m)

max_length=20

if [ $title_length -gt $max_length ]
then
    title=$(echo $title | cut -c 1-$max_length)...
fi

echo "$artist - $title"
