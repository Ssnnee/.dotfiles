#!/usr/bin/env bash
set -euo pipefail

MODE_FILE="$HOME/.config/theme-mode"
GTK_THEME_DARK="Adwaita-dark"
GTK_THEME_LIGHT="Adwaita-light"

if [[ -f "$MODE_FILE" ]]; then
  CURRENT_MODE="$(<"$MODE_FILE")"
  [[ "$CURRENT_MODE" == "dark" ]] && NEW_MODE="light" || NEW_MODE="dark"
else
  NEW_MODE="light"
fi

printf '%s\n' "$NEW_MODE" > "$MODE_FILE.tmp" && mv "$MODE_FILE.tmp" "$MODE_FILE"

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/theme-switch.sh" "$NEW_MODE"
if [[ "$NEW_MODE" == "dark" ]]; then
  gsettings set org.gnome.desktop.interface gtk-theme "${GTK_THEME_DARK}"
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
else
  gsettings set org.gnome.desktop.interface gtk-theme "${GTK_THEME_LIGHT}"
  gsettings set org.gnome.desktop.interface color-scheme prefer-light
fi

if command -v notify-send &>/dev/null; then
  notify-send "Theme Mode" "Switched to $NEW_MODE mode" -t 2000
fi
