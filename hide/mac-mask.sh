#!/bin/bash
# Author: James Campbell
# What: Spoofs your mac address automatically on startup on OSX machines
# Requires: python & OSX, run script as sudo: `sudo mac-mask.sh`
pip install SpoofMac
# Download the startup file for launchd
curl https://raw.githubusercontent.com/feross/SpoofMAC/master/misc/local.macspoof.plist > local.macspoof.plist

# Customize location of `spoof-mac.py` to match your system
cat local.macspoof.plist | sed "s|/usr/local/bin/spoof-mac.py|`which spoof-mac.py`|" | tee local.macspoof.plist

# Copy file to the OS X launchd folder
sudo cp local.macspoof.plist /Library/LaunchDaemons

# Set file permissions
cd /Library/LaunchDaemons
sudo chown root:wheel local.macspoof.plist
sudo chmod 0644 local.macspoof.plist

