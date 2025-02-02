#!/usr/bin/env sh

PLUGIN_DIR="$HOME"/.config/tmux/plugins

if [ ! -d "$PLUGIN_DIR" ]; then
  mkdir -p "$PLUGIN_DIR"
fi

if [ ! -d "$PLUGIN_DIR"/tpm ]; then
  git clone --depth=1 https://github.com/tmux-plugins/tpm "$PLUGIN_DIR"/tpm
fi
