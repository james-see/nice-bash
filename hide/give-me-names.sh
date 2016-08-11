#!/bin/bash
read -n1 -p "New real name or username? [r,u]" doit 
case $doit in  
  r|R|1) telnet koeln.ccc.de | grep : ;
  u|U|2) telnet koeln.ccc.de 31337 ; 
  *) echo "lololololol" ;
esac
