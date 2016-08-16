#!/bin/bash
myip=$(ip route get 8.8.8.8 | awk 'NR==1 {print $NF}')
echo "Current IP address = $myip"
echo "Saved as ~/ip.txt"
echo $myip >> ~/ip.txt
