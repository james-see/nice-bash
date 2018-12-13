# change the first 10\. to whatever your format is 192, 172, etc.
# ifconfig | grep -m1 -E "\b(10\.)([0-9]{1,2}\.){2}[0-9]{1,3}\b" -o | head -n1
# better version
ifconfig | grep inet | grep "inet " | tail -n1 # targets just inet ip4
