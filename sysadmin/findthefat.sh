#!/bin/bash
# Author: James Campbell
# Date: December 2016
# Name: Find the Fat
# What: Finds all files that are larger than a minimum size
echo "   ____         __  __  __         ___     __ ";
echo "  / _(_)__  ___/ / / /_/ /  ___   / _/__ _/ /_";
echo " / _/ / _ \/ _  / / __/ _ \/ -_) / _/ _ \`/ __/";
echo "/_//_/_//_/\_,_/  \__/_//_/\__/ /_/ \_,_/\__/ ";
echo "                                              ";
default="1"
read -p "what min size in GB [1]: " minsize
minsize="${minsize:-${default}}"
sudo find / -type f -size +${minsize}G -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'
