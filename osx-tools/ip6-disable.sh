#!/bin/sh
IFS=$'\n'
net=`networksetup -listallnetworkservices | grep -v asterisk`

for i in $net
do
    networksetup -setv6off "$i"
done
exit 0

