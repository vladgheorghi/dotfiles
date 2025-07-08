#!/bin/bash

# Get battery percentage
BAT_PERCENT=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null)

# Choose icon based on level
if [ "$BAT_PERCENT" -ge 95 ]; then
    ICON="󰁹"  # Full
elif [ "$BAT_PERCENT" -ge 80 ]; then
    ICON="󰂁"
elif [ "$BAT_PERCENT" -ge 60 ]; then
    ICON="󰁾"
elif [ "$BAT_PERCENT" -ge 40 ]; then
    ICON="󰁼"
elif [ "$BAT_PERCENT" -ge 20 ]; then
    ICON="󰁻"
else
    ICON="󰂃"  # Very low
fi

# Output line for config
echo "$ICON $BAT_PERCENT%"

