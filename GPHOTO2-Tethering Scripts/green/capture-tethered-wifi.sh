#!/bin/bash

# select where create subfolders
store_photos_in="$HOME"
camera_model="Nikon DSC D7200"
camera_ip="192.168.1.1"
# create now variable with date values
now=$(date +'%m-%d-%Y.%H.%M.%S')


if ping -c 1 $camera_ip > /dev/null
    then
      echo "Conecting to $camera_model on $camera_ip"
else
      echo "Cant connect to camera_model on $camera_ip"
      exit
fi

# just a message
echo "Tether photos to $store_photos_in/tethered-$now"

# create the folder inside store_photo path dir and make the folder name
# as same as date
mkdir -p $store_photos_in/tethered-$now

# killall process with gphoto to avoid error on device busy
# problem with claim device
# https://askubuntu.com/questions/993876/gphoto2-could-not-claim-the-usb-device
pkill -f gphoto2
pkill -f gphoto


cd "$store_photos_in/tethered-$now" && gphoto2 --port ptpip:$camara_ip "--camera=$camera_model" --capture-tethered --hook-script=hook.sh 


# go to  the new folder created and process capture-tethered
# just a message
echo "Tether photos to $store_photos_in/tethered-$now"
