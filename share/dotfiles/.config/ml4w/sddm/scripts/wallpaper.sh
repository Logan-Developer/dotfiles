#!/bin/bash
#  _   _           _       _                 _     _            
# | | | |_ __   __| | __ _| |_ ___   ___  __| | __| |_ __ ___   
# | | | | '_ \ / _` |/ _` | __/ _ \ / __|/ _` |/ _` | '_ ` _ \  
# | |_| | |_) | (_| | (_| | ||  __/ \__ \ (_| | (_| | | | | | | 
#  \___/| .__/ \__,_|\__,_|\__\___| |___/\__,_|\__,_|_| |_| |_| 
#       |_|                                                     
#  
# by Stephan Raabe (2024) 
# ----------------------------------------------------- 
cache_file="$HOME/.config/ml4w/cache/current_wallpaper"
sleep 1
clear
figlet -f smslant "Set Wallpaper"
echo
echo "Set the current wallpaper as SDDM wallpaper."

current_wallpaper=$(cat "$cache_file")
extension="${current_wallpaper##*.}"

current_theme="eucalyptus-drop"

sudo cp $current_wallpaper "/usr/share/sddm/themes/eucalyptus-drop/Backgrounds/current_wallpaper.$extension"
echo "Current wallpaper copied into /usr/share/sddm/themes/$current_theme/Backgrounds/"
new_wall=$(echo $current_wallpaper | sed "s|$HOME/wallpaper/||g")

echo "DONE! Please logout to test sddm."
sleep 3
