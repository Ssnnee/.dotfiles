#!/usr/bin/env bash
# ~/.config/scripts/theme-switch.sh

WALLPAPER=$(grep "^wallpaper = " ~/.config/waypaper/config.ini | cut -d'=' -f2 | xargs)

# Expand ~ manually
WALLPAPER="${WALLPAPER/#\~/$HOME}"

MODE="${1:-dark}"

if [ -z "$WALLPAPER" ] || [ ! -f "$WALLPAPER" ]; then
    echo "No valid wallpaper found: $WALLPAPER"
    exit 1
fi

echo "Current wallpaper: $WALLPAPER"
echo "Applying $MODE mode..."

matugen image "$WALLPAPER" --mode "$MODE"

echo "Theme applied successfully in $MODE mode!"
