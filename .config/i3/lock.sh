#!/bin/env bash
# This script show a nice matrix lock screen

kitty -e cmatrix  &
sleep 0.5

i3-msg fullscreen

i3lock -n; i3-msg kill
