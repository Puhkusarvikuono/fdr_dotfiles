#!/usr/bin/env bash

# dmenu_sys.sh
# A dmenu-based system menu for killing processes, rebooting, and shutting down.
# Uses colors from pywal.

# Source pywal colors
if [ -f "/home/n-ixis/.cache/wal/colors.sh" ]; then
    . "/home/n-ixis/.cache/wal/colors.sh"
else
    # Fallback colors if pywal cache is not found
    color0="#000000"
    color1="#ff0000"
    color15="#ffffff"
fi

# Main menu options
OPTIONS="kill\nreboot\nshutdown"

# Show dmenu and get user choice
choice=$(echo -e "$OPTIONS" | rofi -dmenu -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -i -c -l 3)

# Execute action based on choice
case "$choice" in
	kill)
		# Show process list and kill the selected one
		ps -u $USER -o pid,comm,%cpu,%mem | rofi -dmenu -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -i -c -l 10 -p "Kill:" | awk '{print $1}' | xargs -r kill
		;;
	reboot)
		systemctl reboot -i
		;;
	shutdown)
		shutdown now
		;;
	*)
		exit 1
		;;
esac

