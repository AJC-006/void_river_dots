#!/bin/bash

INTERFACE="wlo1"
DATA_FILE="/tmp/netspeed_$INTERFACE"

if [ -f "$DATA_FILE" ]; then
    read -r prev_rx prev_tx prev_time < "$DATA_FILE"
else
    prev_rx=0
    prev_tx=0
    prev_time=$(date +%s)
fi

current_rx=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes 2>/dev/null || echo 0)
current_tx=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes 2>/dev/null || echo 0)
current_time=$(date +%s)

time_diff=$((current_time - prev_time))
[ $time_diff -eq 0 ] && time_diff=1

down_speed=$(( (current_rx - prev_rx) / time_diff / 1024 ))
up_speed=$(( (current_tx - prev_tx) / time_diff / 1024 ))

down_unit="KB/s"
up_unit="KB/s"
[ $down_speed -ge 1024 ] && down_speed=$((down_speed / 1024)) && down_unit="MB/s"
[ $up_speed -ge 1024 ] && up_speed=$((up_speed / 1024)) && up_unit="MB/s"

echo "$current_rx $current_tx $current_time" > "$DATA_FILE"

echo "↓$down_speed $down_unit ↑$up_speed $up_unit"