#!/bin/sh

handle() {
  case $1 in
    monitoradded*) ~/.config/hypr/scripts/changeDisplayMode.sh extend ;;
    monitorremoved*) ~/.config/hypr/scripts/changeDisplayMode.sh internal ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
