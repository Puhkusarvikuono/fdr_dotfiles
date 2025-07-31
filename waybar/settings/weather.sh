#!/bin/bash
# Save this script as ~/scripts/weather.sh

# Fetch weather data
weather=$(curl -s wttr.in/oulu?format=1)

# Output the weather data
echo "$weather"

