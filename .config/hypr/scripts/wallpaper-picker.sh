#!/bin/bash
WALLPAPER=$1

# update hyprpaper
hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper " ,$WALLPAPER"

# run matugen on wallpaper
matugen image "$WALLPAPER"

# reload waybar and swaync for sexy wexy colors
pkill -USR2 waybar
swaync-client -rs
