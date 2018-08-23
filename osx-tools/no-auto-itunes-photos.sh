# Disables photos app and itunes app automatically opening when iphone plugged into Mac OS
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist # bye itunes
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true # bye photos
echo "Safe to connect your device now without annoyance."
