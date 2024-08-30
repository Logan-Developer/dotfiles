#!/bin/bash

prompt='Change Display Mode'

# Options
option_1="Extend Display"
option_2="External Display Only"
option_3="Internal Display Only"
option_4="Mirror Display"

# monitor configuration file
monitor_config="$HOME/.config/hypr/conf/monitor.conf"
monitor_conf_content="source = ~/.config/hypr/conf/monitors/"

# changeDisplayMode.sh
changeDisplayMode=".config/hypr/scripts/changeDisplayMode.sh"

# Display names
internal_display="eDP-1"
external_display="HDMI-A-1"

# Rofi CMD
rofi_cmd() {
    rofi -dmenu -replace -config ~/.config/rofi/config-display-modes.rasi -i -no-show-icons -l 4 -width 30 -p "$prompt"
}

# Pass variables to rofi dmenu
run_rofi() {
    echo -e "$option_1\n$option_2\n$option_3\n$option_4" | rofi_cmd
}

# Extend Display
extend_display() {
    $changeDisplayMode extend
}

# External Display Only
external_display_only() {
    $changeDisplayMode external
}

# Internal Display Only
internal_display_only() {
    $changeDisplayMode internal
}

# Mirror Display
mirror_display() {
    $changeDisplayMode mirror
}

# Execute Command
run_cmd() {
    if [[ "$1" == '--opt1' ]]; then
        extend_display
    elif [[ "$1" == '--opt2' ]]; then
        external_display_only
    elif [[ "$1" == '--opt3' ]]; then
        internal_display_only
    elif [[ "$1" == '--opt4' ]]; then
        mirror_display
    else
        exit
    fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$option_1)
    run_cmd --opt1
    ;;
$option_2)
    run_cmd --opt2
    ;;
$option_3)
    run_cmd --opt3
    ;;
$option_4)
    run_cmd --opt4
    ;;
esac
