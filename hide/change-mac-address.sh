#!/bin/bash
# Author: James Campbell
# Date: 12 August 2016
# What: Use pip install spoofmac first then this will allow you to spoof and confirm spoofed mac address
# Requirements: spoofmac python package, OSX, run as sudo
# Alternative requirements: install node npm and then npm install spoof -g
GREEN='\033[1;32m'
CYAN='\033[1;36m'
NC='\033[0m'
command -v spoof >/dev/null 2>&1 || { echo >&2 "I require spoof but it's not installed. On OSX, install via brew install node then npm install spoof -g."; exit 1; }
printf "\n${GREEN}Current devices and mac addresses...${NC}\n\n"
spoof list | grep -o "currently set to.*"
printf "\nRandomizing wifi by running ${CYAN}sudo spoof randomize en0${NC}...\n"
sudo spoof randomize en0
printf "\nHard resetting wifi device to ensure spoof is in place...\n"
networksetup -setairportpower airport off; networksetup -setairportpower airport on
spoof list
echo "Note the Wi-fi device should should a new field for the MAC."
echo "Enjoy!"
