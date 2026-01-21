#!/usr/bin/env bash

GTK_THEME_LIGHT="adw-gtk3-light"
GTK_THEME_DARK="adw-gtk3-dark"

current_theme="$(gsettings get org.gnome.desktop.interface gtk-theme | tr -d "'")"

if [[ "$current_theme" == "$GTK_THEME_DARK" ]]; then
    gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME_LIGHT"
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
else
    gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME_DARK"
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
fi

