#!/bin/bash
echo "Starting heartbeat loop every 15 minutes..."
while true; do
  bash "$(dirname "$0")/heartbeat.sh"
  sleep 900
done
