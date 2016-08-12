#!/bin/bash
# Author: James Campbell
# Date: 12 August 2016
# What: Use pip install spoofmac first then this will allow you to spoof and confirm spoofed mac address
# Requirements: spoofmac python package, OSX, run as sudo

spoof list
sudo spoof randomize en0
networksetup -setairportpower airport off; networksetup -setairportpower airport on
spoof list
