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

artist_length=$(echo -n $artist | wc -m)
title_length=$(echo -n $title | wc -m)

max_length=20

if [ $title_length -gt $max_length ]
then
    title=$(echo $title | cut -c 1-$max_length)...
fi

if [ $artist_length -gt $max_length ]
then
    artist=$(echo $artist | cut -c 1-$max_length)...
fi

if [ $artist_length -eq 0 ]
then
    echo "$title"
else
    echo "$artist - $title"
fi
