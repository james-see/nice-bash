#!/bin/bash
# Author: James Campbell
# Date: 12 August 2016
# What: Use pip install spoofmac first then this will allow you to spoof and confirm spoofed mac address
# Requirements: spoofmac python package, OSX, run as sudo
# Alternative requirements: install node npm and then npm install spoof -g

echo "Current devices and mac addresses..."
spoof list
echo "Randomizing wifi by running sudo spoof randomize en0..."
sudo spoof randomize en0
echo "Hard resetting wifi device to ensure spoof is in place..."
networksetup -setairportpower airport off; networksetup -setairportpower airport on
spoof list
echo "Note the Wi-fi device should should a new field for the MAC."
echo "Enjoy!"
