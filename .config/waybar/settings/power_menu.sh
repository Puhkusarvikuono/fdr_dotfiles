#!/bin/bash

# Check if dmenu is installed
if ! command -v dmenu &> /dev/null; then
    echo "dmenu could not be found. Please install it."
    exit 1
fi

# Display a simple menu using `dmenu`
ACTION=$(echo -e "Shutdown\nReboot\nSuspend\nHibernate" | dmenu -i -p "Select action:")

# Check if an action was selected
if [ -z "$ACTION" ]; then
    exit 1
fi

case "$ACTION" in
    "Shutdown")
        systemctl poweroff
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Hibernate")
        systemctl hibernate
        ;;
    *)
        echo "Invalid action selected."
        exit 1
        ;;
esac

