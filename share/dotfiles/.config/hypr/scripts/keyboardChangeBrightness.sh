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

# check parameter (up or down)
if [ "$1" == "up" ]; then
    newBrightness=$((currentBrightness + 50))
    notify-send "Keyboard Brightness increased"
elif [ "$1" == "down" ]; then
    newBrightness=$((currentBrightness - 50))
    notify-send "Keyboard Brightness decreased"
else
    echo "Error: Invalid parameter"
    exit 1
fi

# check if the new brightness is within the range
if [ $newBrightness -lt 0 ]; then
    newBrightness=0
elif [ $newBrightness -gt 255 ]; then
    newBrightness=255
fi

# set new brightness
echo $newBrightness > $rgbBrightnessFile