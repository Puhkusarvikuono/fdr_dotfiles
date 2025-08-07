#!/bin/bash

# spotify_search.sh
# Uses dmenu to search for a track on Spotify and starts playback.
# Depends on spotify_player, dmenu, and jq.


# Get search query from user via dmenu
query=$(echo "" | rofi -dmenu -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -p "Search Spotify:")

# Exit if no query is provided
if [ -z "$query" ]; then
    echo "No query provided. Exiting."
    exit 1
fi

# Search for the track and start playback
# Extracts the ID of the first track from the search results using jq
TRACK_ID=$(spotify_player search "$query" | jq -r '.tracks.[0].id')

if [ -n "$TRACK_ID" ] && [ "$TRACK_ID" != "null" ]; then
    spotify_player playback start track --id "$TRACK_ID"
else
    echo "No track found for query: '$query'"
    exit 1
fi

