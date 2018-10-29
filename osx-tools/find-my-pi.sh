# Find your raspberry pi devices on the network
# arp -na | grep -i b8:27:eb # does not seem to work anymore
# the below works but is slow, patience is a virtue
sudo nmap -sP 10.2.2.0/24 | awk '/^Nmap/{ip=$NF}/B8:27:EB/{print ip}'

