#!/bin/bash

# select where create subfolders
store_photos_in="$HOME"


camera_model=""

# create now variable with date values
now=$(date +'%m-%d-%Y.%H.%M.%S')

# just a message
echo "Tether photos to $store_photos_in/tethered-$now"

# create the folder inside store_photo path dir and make the folder name
# as same as date
mkdir -p "$store_photos_in/tethered-$now"

# killall process with gphoto to avoid error on device busy
# problem with claim device
# https://askubuntu.com/questions/993876/gphoto2-could-not-claim-the-usb-device
pkill -f gphoto2
pkill -f gphoto

touch  "$store_photos_in/tethered-$now/latest.jpg"
/usr/bin/geeqie "$store_photos_in/tethered-$now/latest.jpg" &
# check if camera_model is empty
if [ -z "$camera_model" ];then
# if camera_model is empty, just run capture without camera options
cd "$store_photos_in/tethered-$now" && gphoto2 --capture-tethered --keep --hook-script=$HOME/Desktop/Applications/hook.sh

else
# if camera_model have data in it
cd "$store_photos_in/tethered-$now" && gphoto2 --capture-tethered --hook-script=hook.sh "--camera=$camera_model"

fi

# go to  the new folder created and process capture-tethered
# just a message
echo "Tether photos to $store_photos_in/tethered-$now"
