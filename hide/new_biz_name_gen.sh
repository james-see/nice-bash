#!/bin/bash
# What: Uses nsanamegenerator.com to give you some inspiration
clear
echo "+++==== Here is your brand new business name: ====+++"
echo ""
echo ""
curl nsanamegenerator.com | grep body | sed -n 2p | sed 's|["<\/body>",]||g'
echo ""
