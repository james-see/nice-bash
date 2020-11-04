#!/bin/bash
# use this: 1LBDSQTJN7LADJRRb8AQNjEj6uKBrihcS9 as a test wallet (from librechan)
# author: James Campbell
# date: 10 August 2016
# date updated: 4 November 2020 
# last change: added ability to pass wallet hash in as argument to skip input
# what: look up current balance for any bitcoin wallet
clear
echo ""
echo ""
echo "     ______ ________________        ______                          ";
echo "     ___  /____(_)_  /___  /_______ ___  /_____ __________________  ";
echo "     __  __ \_  /_  __/_  __ \  __  /_  /_  __  /_  __ \  ___/  _ \ ";
echo "     _  /_/ /  / / /_ _  /_/ / /_/ /_  / / /_/ /_  / / / /__ /  __/ ";
echo "     /_.___//_/  \__/ /_.___/\__,_/ /_/  \__,_/ /_/ /_/\___/ \___/  ";
echo ""
echo "     ----- uses https://blockchain.info -----   ";
echo "     PGP FINGERPRINT: 68FD DA56 B687 64FF 56CA 74A6 AAF8 A86B F0DA 9511";
echo ""
echo ""
if [ $# -eq 0 ]; then
    printf "     Wallet to check ----:> "
    read -r bitwallet
else
bitwallet=$1
fi
echo "     You entered: $bitwallet"
curl --silent "https://blockchain.info/address/$bitwallet?format=json" > balance.txt &
pid=$!

spin[0]="-"
spin[1]="\\"
spin[2]="|"
spin[3]="/"

echo "     [processing wallet balance] ${spin[0]}"
i=1
sp="/-\|"
echo ' '
while ps -p $pid > /dev/null;
do
    printf "\b${sp:i++%${#sp}:1}"
done
clear
bitbalance=$(cat balance.txt | grep "balance" | sed 's/,$//' | sed 's/.*://')
bitbalancefix=$(bc -l <<< "$bitbalance/100000000")
printf "     Balance for Wallet $bitwallet is: "
printf "%.6f" $bitbalancefix
echo ""
echo ""
rm -rf balance.txt
