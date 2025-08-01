#!/bin/bash

connected=$(ip link show type wireguard | head -n 1 | awk '{print $2}')

if [ -n "$connected" ]; then
  echo "{\"text\": \"$connected ON\", \"tooltip\": \"VPN Connected: $connected\", \"class\": \"on\"}"
else
  echo "{\"text\": \"OFF\", \"tooltip\": \"VPN Disconnected\", \"class\": \"off\"}"
fi

