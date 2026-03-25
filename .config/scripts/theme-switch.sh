#!/usr/bin/env bash
# ~/.config/scripts/theme-switch.sh

set -euo pipefail
MODE="${1:-}"  # If no arg, figure out current mode
MODE_FILE="$HOME/.config/theme-mode"
COLOR_TO_PICK=$(( RANDOM % 4 ))
if [[ -z "$MODE" ]]; then
  if [[ -f "$MODE_FILE" ]]; then
    CURRENT_MODE=$(<"$MODE_FILE")
    MODE="$CURRENT_MODE"
  else
    MODE="light"
  fi
fi

WALLPAPER="$(grep -E '^\s*wallpaper\s*=' "$HOME/.config/waypaper/config.ini" \
  | head -n1 \
  | cut -d'=' -f2 \
  | xargs)"
WALLPAPER="${WALLPAPER/#\~/$HOME}"
if [[ -z "$WALLPAPER" || ! -f "$WALLPAPER" ]]; then
  echo "Invalid wallpaper: $WALLPAPER"
  exit 1
fi
export THEME_MODE="$MODE"
echo "[$(date '+%F %T')] Generating color scheme"
echo "Mode      : $MODE"
echo "Wallpaper : $WALLPAPER"
echo "$MODE" > "$MODE_FILE"
matugen image "$WALLPAPER" --mode "$MODE" --source-color-index "$COLOR_TO_PICK"
echo "Color scheme generated successfully"
