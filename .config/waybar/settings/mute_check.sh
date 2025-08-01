#!/bin/bash

# mute_check.sh
# Checks if the default audio sink is muted and sends a notification.
# This script is likely used by a status bar component.

# Get the mute state using pactl
MUTESTATE=$(pactl get-sink-mute @DEFAULT_SINK@)

# Send a notification based on the mute state
if [[ "$MUTESTATE" == "Mute: yes" ]]; then
    notify-send "Audio muted 🔇"
else
    notify-send "Audio unmuted 🔊"
fi

