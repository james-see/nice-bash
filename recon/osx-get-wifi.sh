#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root using sudo"
  exit
fi
echo "Loading wifi data now for current device and nearby available networks.";
echo "If you want to save to file rerun as sudo osx-get-wifi.sh > data.txt";
sudo system_profiler SPAirPortDataType
