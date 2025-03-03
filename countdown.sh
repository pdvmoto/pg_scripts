#!/bin/bash

# Check if argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <seconds>"
  exit 1
fi

# Countdown loop
for ((i=$1; i>=0; i--)); do
  echo -ne "\rCountdown: $i seconds remaining"
  sleep 1
done

echo -e "\nTime's up!"

countdown() {
  local seconds=$1
  for ((i=seconds; i>=0; i--)); do
    echo -ne "\rCountdown: $i seconds remaining"
    sleep 1
  done
  echo -e "\nTime's up!"
}

# Check if argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <seconds>"
  exit 1
fi

# Call the countdown function
countdown $1

