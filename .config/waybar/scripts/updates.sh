#!/bin/bash

# Check for updates using dnf
# We use check-update; it returns 100 if updates exist, 0 if not
updates=$(dnf check-update -q | grep -v "^$" | wc -l)

if [ "$updates" -gt 0 ]; then
    echo "{\"text\":\"$updates\", \"tooltip\":\"$updates updates available\"}"
else
    echo "{\"text\":\"0\", \"tooltip\":\"System up to date\"}"
fi
