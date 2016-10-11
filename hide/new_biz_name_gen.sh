#!/bin/bash
# What: Uses nsanamegenerator.com to give you some inspiration and asks how many you want generated
clear
echo "+++==== Here is your brand new business name: ====+++"
echo ""
echo ""
read -p "how many names do you need? [1]: " total
totaldef=1
total="${total:-${totaldef}}"
for i in `eval echo {1..$total}`
do
        curl -s nsanamegenerator.com | grep body | sed -n 2p | sed 's|["<\/body>",]||g'
done
echo ""
echo ""
