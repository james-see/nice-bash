#!/bin/bash
# What: erases a file securely, asks you OS then runs command based on the filename arg you passed
echo " ____  ____   __   ____  ____    _  _  ____ ";
echo "(  __)(  _ \ / _\ / ___)(  __)  ( \/ )(  __)";
echo " ) _)  )   //    \\___ \ ) _)   / \/ \ ) _) ";
echo "(____)(__\_)\_/\_/(____/(____)  \_)(_/(____)";
echo ""
read -n1 -p "Linux, OSX, or Windows? [l,o,w]: " doit 
case $doit in  
  l|L|1) shred -f -u -n 7 $1 ;;
  o|O|2) srm -f -z --medium $1 ;; 
  w|W|3) sdelete.exe -q -p 7 $1 ;; 
  *) echo "lololololol" ;;
esac

echo "All done wiping the file." 
echo "'People are deceived in masses, but enlightened one at a time. - Dick Boddie'"
echo
