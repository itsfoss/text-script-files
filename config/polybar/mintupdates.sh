#!/bin/bash

# Define colors manually (match your Polybar theme)
green="#53E8D4"    # Aurora Green
yellow="#FFFDBB"   # Aurora Yellow
red="#A54242"      # Alert Red

# Get the number of available updates using mintupdate-cli
updates=$(mintupdate-cli list | wc -l)

# Determine the color based on the number of updates
if [ "$updates" -eq 0 ]; then
    color="$green"
elif [ "$updates" -le 10 ]; then
    color="$yellow"
else
    color="$red"
fi

# Output the result in Polybar format with the selected color
echo -e "%{F$color} Up: $updates%{F-}"

