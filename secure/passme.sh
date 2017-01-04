#!/bin/bash
# What: Creates either letter&num or letter&num&special char based passwords of length you set 
# and also can create a list of them as needed
clear
echo "";
echo "";
echo "";
echo " ____   __    ___  ___  __  __  ____ ";
echo "(  _ \ /__\  / __)/ __)(  \/  )( ___)";
echo " )___//(__)\ \__ \\__ \ )    (  )__) ";
echo "(__) (__)(__)(___/(___/(_/\/\_)(____)";
echo "";
echo "[*] the secure password generator using /dev/urandom [*]";
echo ""
echo ""
read -n1 -p "with special chars or without? [s,w]: " doit
echo ""
default="32"
read -p "length? recommended at least 32 [32]: " lnn
lnn="${lnn:-${default}}"
read -p "how many times? [1]: " hmt
defaulthmt=1
hmt="${hmt:-{defaulthmt}}"
case $doit in
  s|S|1)
        for i in `eval echo {1..$hmt}`
        do
                perl -pe 'tr/A-Za-z0-9_\!\@\#\$\%\^\&\*\(\)-+=//dc;' < /dev/urandom | h$
        done
        ;;
w|W|2)
        for i in `eval echo {1..$hmt}`
        do
                perl -pe 'tr/A-Za-z0-9//dc;' < /dev/urandom | head -c $lnn; echo
        done
        ;;
  *) echo "lololololol" ;;
esac
