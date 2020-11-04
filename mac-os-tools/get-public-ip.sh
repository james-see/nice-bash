#!/bin/bash
publicip=$(curl https://ipof.me/ip -s)
echo "Current public IP address = $publicip"
echo "Saved as ~/.public-ip.txt"
echo $publicip >> ~/.public-ip.txt


