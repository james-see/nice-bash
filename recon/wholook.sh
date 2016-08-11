#!/bin/bash
# this gets the ip address and the owning server org of the ip address WITH SPINNERS WHILE WAITING
# example (save file as whodig.sh and chmod a+x) then run whodig.sh jamescampbell.us
echo "Looking up ip and owner info for input..."
dig +short $1 > nslook.txt &
pid=$!
 
spin[0]="-"
spin[1]="\\"
spin[2]="|"
spin[3]="/"
 
echo -n "[processing ip address] ${spin[0]}"
while ps -p $pid > /dev/null;
do
       for i in "${spin[@]}"
       do
               echo -ne "\b$i"
               sleep 0.1
       done
done
whois $(<nslook.txt) | grep "OrgName" > organ.txt &
pid=$!
spin[0]="-"
spin[1]="\\"
spin[2]="|"
spin[3]="/"
 
echo -n "[processing owner] ${spin[0]}"
while ps -p $pid > /dev/null;
do
    for i in "${spin[@]}"
    do
        echo -ne "\b$i"
        sleep 0.1
    done
echo -ne "\b"
echo ""
done
echo "IP address of input: " $(<nslook.txt)
echo "Organization owning IP address: " $(<organ.txt)
rm nslook.txt
rm organ.txt
