#!/bin/sh

# Check if cliphist is installed
if ! command -v cliphist >/dev/null 2>&1; then
    echo '{"text": "󰅍 Err", "tooltip": "cliphist not found"}'
    exit 1
fi

# Get latest entry
latest=$(cliphist list | head -n 1 | sed 's/"/\\"/g' | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g')

# Count items
count=$(cliphist list | wc -l)

# Fallback if something failed
if [ -z "$count" ]; then
    count=0
fi

# Output as JSON
echo "{\"text\": \"󰅍 $count\", \"tooltip\": \"$latest\"}"
