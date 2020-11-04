#!/bin/bash
if brew ls --versions iproute2mac > /dev/null; then
	echo "ip command found, continuing..."
	myip=$(ip route get 8.8.8.8 | awk 'NR==1 {print $NF}')
	echo "Current private IP address = $myip"
	echo "Saved as ~/.private-ip.txt"
	echo $myip >> ~/.private-ip.txt
else
	brew install iproute2mac
	echo "please run again"
fi

