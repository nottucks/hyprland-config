#!/bin/bash

cache_file="/tmp/waybar-update-cache.json"
now=$(date +%s)

if [ -f "$cache_file" ]; then
    cache_age=$(stat -c %Y "$cache_file")
else
    cache_age=0
fi

if [ ! -f "$cache_file" ] || (( now - cache_age > 1800 )); then
    arch_updates=$(checkupdates 2>/dev/null)
    arch=$(echo "$arch_updates" | grep -v '^$' | wc -l)

    aur_updates=$(yay -Qua 2>/dev/null)
    aur=$(echo "$aur_updates" | grep -v '^$' | wc -l)

    flatpak_updates=$(flatpak remote-ls --updates --columns=ref 2>/dev/null)
    flatpak=$(echo "$flatpak_updates" | grep -v '^$' | wc -l)

    total=$((arch + aur + flatpak))

    tooltip="Arch: $arch
AUR: $aur
Flatpak: $flatpak"

    if [ "$total" -gt 0 ]; then
        output=$(jq -nc --arg text "Updates: $total" --arg tooltip "$tooltip" '{text: $text, tooltip: $tooltip}')
    else
        output=$(jq -nc '{text: "", tooltip: ""}')
    fi

    echo "$output" > "$cache_file"
    echo "$output"
else
    cat "$cache_file"
fi
