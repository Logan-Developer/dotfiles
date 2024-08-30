#!/bin/bash

rgbBrightnessFile="/sys/class/leds/rgb:kbd_backlight/brightness"

# check if the file exists
if [ ! -f $rgbBrightnessFile ]; then
    echo "Error: $rgbBrightnessFile does not exist"
    exit 1
fi

# check if the file is readable and writable
if [ ! -r $rgbBrightnessFile ] || [ ! -w $rgbBrightnessFile ]; then
    echo "Error: $rgbBrightnessFile is not readable and writable"
    exit 1
fi

# check current brightness
currentBrightness=$(cat $rgbBrightnessFile)

# toggle brightness
if [ $currentBrightness -eq 0 ]; then
    echo 255 > $rgbBrightnessFile
    notify-send "Keyboard RGB activated"
else
    echo 0 > $rgbBrightnessFile
    notify-send "Keyboard RGB deactivated"
fi
