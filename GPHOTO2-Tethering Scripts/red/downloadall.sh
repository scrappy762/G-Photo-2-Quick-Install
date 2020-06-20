#!/bin/bash

# select where create subfolders
store_photos_in="$HOME"

# create now variable with date values
now=$(date +'%m-%d-%Y.%H.%M.%S')
# just a message
echo "Download all photos in $store_photos_in/$now"

# create the folder inside store_photo path dir and make the folder name
# as same as date
mkdir -p "$store_photos_in/$now"


pkill -f gphoto2
pkill -f gphoto

# go to  the new folder created and process do dowload all photos
cd "$store_photos_in/$now" && gphoto2 --get-all-files

geeqie "$store_photos_in/$now" &
