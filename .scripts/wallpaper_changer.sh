#!/bin/bash

# wallpaper_changer.sh
# Selects a wallpaper from a directory using dmenu, sets it with pywal and hyprpaper,
# and restarts relevant components.


WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"
CURRENT_BACKGROUND_LINK="$HOME/Documents/Current/background.jpg"

# Check if the wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Wallpaper directory not found: $WALLPAPER_DIR"
    exit 1
fi

# Use dmenu to select a wallpaper
SELECTED_WALLPAPER=$(ls "$WALLPAPER_DIR" | rofi -dmenu -i -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -c -l 10)

if [ -n "$SELECTED_WALLPAPER" ]; then 
    FULL_WALLPAPER_PATH="$WALLPAPER_DIR$SELECTED_WALLPAPER"
    echo "Selected wallpaper: '$FULL_WALLPAPER_PATH'"

    # Update current wallpaper and reload sway (which sets wallpaper and restarts waybar)

    ln -nsf "$FULL_WALLPAPER_PATH" "$CURRENT_BACKGROUND_LINK"
    sway reload
else
    echo "No wallpaper selected."
    exit 1
fi

