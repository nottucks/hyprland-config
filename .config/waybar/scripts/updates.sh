#!/bin/bash

cache_file="/tmp/waybar-update-cache.json"
now=$(date +%s)
if [ -f "$cache_file" ]; then
    cache_age=$(stat -c %Y "$cache_file")
else
    cache_age=0
fi

if ((now - cache_age > 1800 )); then
    arch=$(checkupdates 2>/dev/null | wc -l || echo 0)
    aur=$(yay -Qu 2>/dev/null | wc -l || echo 0)
    flatpak=$(flatpak remote-ls --updates 2>/dev/null | wc -l || echo 0)
    
    total=$((arch + aur + flatpak))
    
    tooltip="Arch: $arch\\nAUR: $aur\\nFlatpak: $flatpak"
    
    if [ "$total" -gt 0 ]; then
        output="{\"text\": \"$total\", \"tooltip\": \"$tooltip\"}"
    else
        output="{\"text\": \"\", \"tooltip\": \"System up to date\"}"
    fi
    echo "$output" > "$cache_file"
    echo "$output"
else
    cat "$cache_file"
fi
