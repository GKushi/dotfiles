#!/usr/bin/env bash

BATTERY_PATH="/sys/class/power_supply/BAT0"
THRESHOLD=30
CACHE_FILE="/tmp/.battery_notified"
CRITICAL_THRESHOLD=10
CRITICAL_CACHE_FILE="/tmp/.crititcal_battery_notified"

# Get current battery percentage
if [ ! -d "$BATTERY_PATH" ]; then
  echo "Battery path not found: $BATTERY_PATH"
  exit 1
fi

capacity=$(cat "$BATTERY_PATH/capacity")

# Low -> normal notification
if [ "$capacity" -le "$THRESHOLD" ]; then
  if [ ! -f "$CACHE_FILE" ]; then
    notify-send -u normal "Battery low" "Battery at ${capacity}%"
    pw-play $1
    touch "$CACHE_FILE"
  fi
else
  # Reset cache if above threshold
  [ -f "$CACHE_FILE" ] && rm "$CACHE_FILE"
fi

# Critical -> critical notification
if [ "$capacity" -le "$CRITICAL_THRESHOLD" ]; then
  if [ ! -f "$CRITICAL_CACHE_FILE" ]; then
    notify-send -u critical "Battery very low" "Battery at ${capacity}%"
    pw-play $1
    touch "$CRITICAL_CACHE_FILE"
  fi
else
  # Reset cache if above threshold
  [ -f "$CRITICAL_CACHE_FILE" ] && rm "$CRITICAL_CACHE_FILE"
fi
