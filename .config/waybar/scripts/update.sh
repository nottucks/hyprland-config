#!/bin/bash

yay

sudo flatpak update

rm -f /tmp/waybar-update-cache.json

echo -e "\nVerifying update status..."

$HOME/.config/waybar/scripts/check_updates.sh > /dev/null

pkill -RTMIN+8 waybar

echo "Done! Press enter to exit."
read
