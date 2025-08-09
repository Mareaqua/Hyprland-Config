#!/bin/bash

# Use absolute paths
WALLPAPER_DIR="$HOME/Pictures/Wallpapers/Arch/Wallpapers"

# Verify Hyprland session
if [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    notify-send "Wallpaper Error" "Not running in Hyprland session!"
    exit 1
fi

# Find random wallpaper
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
[ -z "$RANDOM_WALLPAPER" ] && exit 0  # Silent fail if no wallpapers

# Execute hyprpaper commands
hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$RANDOM_WALLPAPER"
hyprctl hyprpaper wallpaper ",$RANDOM_WALLPAPER"
jp2a "$RANDOM_WALLPAPER" --colors --background=light > .config/fastfetch/logo.txt

exit 0
