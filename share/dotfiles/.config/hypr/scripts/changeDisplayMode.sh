#!/bin/bash

# monitor configuration file
monitor_config="$HOME/.config/hypr/conf/monitor.conf"
monitor_conf_content="source = ~/.config/hypr/conf/monitors/"

# Display names
INTERNAL="eDP-1"
EXTERNAL="HDMI-A-1"

# Configurations (adjust resolutions and positions as needed)
EXTEND="echo $monitor_conf_content\"extend.conf\" > $monitor_config"
EXTERNAL_ONLY="echo $monitor_conf_content\"external.conf\" > $monitor_config"
INTERNAL_ONLY="echo $monitor_conf_content\"internal.conf\" > $monitor_config"
MIRROR="echo $monitor_conf_content\"mirror.conf\" > $monitor_config"

function split_workspaces {
	curr_monitor=$INTERNAL
	for i in $(hyprctl workspaces | grep -e "workspace ID [0-9]" | wc -l); do
		hyprctl dispatch workspace $i monitor $INTERNAL
		if [[ $curr_monitor == $INTERNAL ]]; then
			curr_monitor=$EXTERNAL
		else
			curr_monitor=$INTERNAL
		fi
	done
}

function workspaces_one_screen {
	local monitor=$1
	shift

	for i in $(hyprctl workspaces | grep -e "workspace ID [0-9]" | wc -l); do
		hyprctl dispatch workspace $i monitor $monitor
	done
}


# Functions to apply configurations
function extend_displays {
    eval $EXTEND
    split_workspaces
    notify-send "Display Mode" "Extended Display"
}

function external_only {
    eval $EXTERNAL_ONLY
    workspaces_one_screen $EXTERNAL
    notify-send "Display Mode" "External Display Only"
}

function internal_only {
    eval $INTERNAL_ONLY
    workspaces_one_screen $INTERNAL
    notify-send "Display Mode" "Internal Display Only"
}

function mirror_displays {
    eval $MIRROR
    workspaces_one_screen $INTERNAL
    notify-send "Display Mode" "Mirror Display"
}

function default_mode {
	connected_monitors=$(hyprctl monitors all| grep 'Monitor' | wc -l)
	if [ $connected_monitors -eq 2 ]; then  # Check if two monitors are connected
        	extend_displays  # Switch to dual display mode
		current_mode="extend"
	else
		internal_only # one monitor
		current_mode="internal"
    	fi
}


# Handle arguments
case "$1" in
    "extend")
	extend_displays
	current_mode="extend"
        ;;
    "external")
        external_only
	current_mode="external"
        ;;
    "internal")
        internal_only
	current_mode="internal"
        ;;
    "mirror")
        mirror_displays
	current_mode="mirror"
        ;;
    *)
	# default mode
	default_mode
	;;
esac
