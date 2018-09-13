# Find your raspberry pi devices on the network
# arp -na | grep -i b8:27:eb # does not seem to work anymore
sudo nmap -sP 192.168.1.0/24 | awk '/^Nmap/{ip=$NF}/B8:27:EB/{print ip}'

