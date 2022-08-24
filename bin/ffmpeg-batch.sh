source_extension=$1
destination_extension=$2
source_directory=$3
destination_directory=$4
options=$5

for filename in "$source_directory"/*.$source_extension; do

    base_path=${filename%.*}
    base_name=${base_path##*/}

    ffmpeg -i "$filename" $options "$destination_directory"/"$base_name"."$destination_extension"

done

