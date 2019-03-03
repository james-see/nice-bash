#!/bin/bash
if brew ls --versions iproute2mac > /dev/null; then
	echo "ip command found, continuing..."
	myip=$(ip route get 8.8.8.8 | awk 'NR==1 {print $NF}')
	echo "Current IP address = $myip"
	echo "Saved as ~/ip.txt"
	echo $myip >> ~/ip.txt
else
	brew install iproute2mac
fi

