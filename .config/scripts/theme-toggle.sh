#!/usr/bin/env bash
# ~/.config/scripts/theme-toggle.sh

MODE_FILE=~/.config/theme-mode

if [ -f "$MODE_FILE" ]; then
    CURRENT_MODE=$(cat "$MODE_FILE")
    if [ "$CURRENT_MODE" = "dark" ]; then
        NEW_MODE="light"
    else
        NEW_MODE="dark"
    fi
else
    NEW_MODE="light"
fi

echo "$NEW_MODE" > "$MODE_FILE"
~/.config/scripts/theme-switch.sh "$NEW_MODE"

# Optional: Send notification
if command -v notify-send &> /dev/null; then
    notify-send "Theme Mode" "Switched to $NEW_MODE mode" -t 2000
fi
