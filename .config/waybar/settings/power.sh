#!/usr/bin/env bash

# power.sh
# A wofi/dmenu-based power menu for system actions like poweroff, reboot, etc.

op=$( echo -e "  Poweroff\n  Reboot\n  Suspend\n  Lock\n  Logout" | wofi -i --dmenu --width 200 --height 300 --sort_order=ALPHABETICAL | awk '{print tolower($2)}' )

case $op in 
  poweroff)
    systemctl poweroff
    ;;
  reboot)
    systemctl reboot
    ;;
  suspend)
    systemctl suspend
    ;;
  lock)
    hyprlock  
    ;;
  logout)
    hyprctl dispatch exit
    ;;
esac

