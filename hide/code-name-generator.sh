#!/bin/bash
# What: Uses nsanamegenerator.com to give you some inspiration and asks how many you want generated
CYAN='\033[1;36m'
NC='\033[0m'
clear
echo "+++==== CODE NAME GENERATOR ====+++"
echo ""
echo ""
read -p "how many names do you need? [1]: " total
totaldef=1
total="${total:-${totaldef}}"
echo ""
echo ""
printf "+++==== ${CYAN}Your brand new code name(s)${NC}: ====+++"
echo ""
echo ""
for i in `eval echo {1..$total}`
do
        #curl -s https://ternus.github.io/nsaproductgenerator/ | grep '<div id="name">'
       #curl -s http://www.codenamegenerator.com/ | grep -o '+3"><b>.*\s*.*'
        #curl -s http://codenamegenerator.com/ | grep -oP "<title>(.*)</title>"
        #curl -s 'http://www.codenamegenerator.com/' | sed 's/.* \(codename.*\) .*/\1/'
        #echo $raw
        # got it finally
        curl -s http://www.codenamegenerator.com/ | tr -d '\r\n' | grep -o -m1 '+3"><b>[a-zA-Z]\+' | tr -d '+3"><b>' | sed -e 's/Generate//g'
done
echo ""
echo ""
