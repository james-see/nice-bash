#!/bin/bash
# What: Creates a password that is 64 characters long including special chars
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
perl -pe 'tr/A-Za-z0-9_\!\@\#\$\%\^\&\*\(\)-+=//dc;' < /dev/urandom | head -c 32; echo
