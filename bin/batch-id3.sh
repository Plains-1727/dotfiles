#!/bin/bash

directory=$1

if [[ -z $directory ]]; then
    echo "No directory given"
    exit
fi

path=""

if [[ $directory = /* ]]; then
   path=$directory
elif [[ $directory = ~* ]]; then
    home=$(echo $HOME)
    path_from_home=$(echo $directory | sed -r "s/~//")
    path=$home$path_from_home
else
    path="./${directory}"
fi

if ! [[ -d $path ]]; then
    echo "ERROR: Path '$path' does not exist."
    exit
fi

echo -n "Artist: "
read artist

echo -n "Album: "
read album

echo -n "Year: "
read year

for file in "$path"/*; do
    filename=$(basename "$file")
    filename_no_ext=$(echo "$filename" | sed -e "s/\..*//" | sed -r "s/[^a-zA-Z]+//")

    echo "Filename: ${filename}"

    echo -n "Song [$filename_no_ext]: "
    read song
    song=${song:-$filename_no_ext}

    echo -n "Track: "
    read track

    id3v2 "$file" -a "$artist" -A "$album" -T $track -t "$song" -y $year

    #if ( id3v2 "$file" -a "$artist" -A "$album" -T $track -t "$song" -y $year > /dev/null); then
     #   echo "Something went wrong!"
      #  exit
    #fi

    if [ $track -le 9 ]; then
        track="0${track}"
    fi

    extension=$(echo $filename | grep -o "\..*")
    new_filename="${track}-${filename_no_ext}${extension}"
    new_path=$(echo $file | perl -p -e "s/([^\/]+$)/$new_filename/g")

    echo -n "Do you want me to rename the file $filename to $new_filename? [y/N]: "
    read rename

    if [ $rename = "y" ]; then
        mv -i -v $file $new_path 
    fi
done
