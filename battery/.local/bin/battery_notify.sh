#!/usr/bin/env bash

BATTERY_PATH="/sys/class/power_supply/BAT0"
THRESHOLD=20
CACHE_FILE="/tmp/.battery_notified"

# Get current battery percentage
if [ ! -d "$BATTERY_PATH" ]; then
  echo "Battery path not found: $BATTERY_PATH"
  exit 1
fi

capacity=$(cat "$BATTERY_PATH/capacity")
# status=$(cat "$BATTERY_PATH/status")

# Only warn if discharging and below threshold
if [ "$capacity" -le "$THRESHOLD" ]; then
  if [ ! -f "$CACHE_FILE" ]; then
    notify-send -u critical "Battery low" "Battery at ${capacity}%"
    touch "$CACHE_FILE"
  fi
else
  # Reset cache if above threshold
  [ -f "$CACHE_FILE" ] && rm "$CACHE_FILE"
fi
