#!/bin/bash
# What: erases a file securely, asks you OS then runs command based on the filename arg you passed
clear
echo ""
echo " ____  ____   __   ____  ____    _  _  ____ ";
echo "(  __)(  _ \ / _\ / ___)(  __)  ( \/ )(  __)";
echo " ) _)  )   //    \\___ \ ) _)   / \/ \ ) _) ";
echo "(____)(__\_)\_/\_/(____/(____)  \_)(_/(____)";
echo ""
echo ""
read -n1 -p "Linux, OSX, or Windows? [l,o,w]: " doit 
echo "\n";
echo "you picked $doit, wiping $1 now."
echo "this may take awhile depending on how crappy your computer is..."
case $doit in  
  l|L|1) shred -f -u -n 7 $1 & pid=$!;;
  o|O|2) srm -f -z --medium $1 & pid=$!;; 
  w|W|3) sdelete.exe -q -p 7 $1 & pid=$!;; 
  *) echo "lololololol" ;;
esac
spin[0]="-"
spin[1]="\\"
spin[2]="|"
spin[3]="/"
=1
sp="/-\|"
echo ' '
while ps -p $pid > /dev/null;
do
    printf "\b${sp:i++%${#sp}:1}"
done
echo ""
echo "All done wiping the file." 
echo "'People are deceived in masses, but enlightened one at a time. - Dick Boddie'"
echo "";
echo
