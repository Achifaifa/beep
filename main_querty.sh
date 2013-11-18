#!/bin/bash

choice=

#Main keyboard function
function init 
{
echo "Teclado inicializado. Pulsa 0 para salir"
until [ "$yek" = 0 ]; do
local yek="$@"
  read -n1 yek
  
  case "$yek" in
   q) 	beep -f 261.626 ;;
   a) 	beep -f 277.183 ;;
   s) 	beep -f 293.665 ;;
   d) 	beep -f 311.127 ;;
   f) 	beep -f 329.628 ;;
   g) 	beep -f 349.228 ;;
   h)	beep -f 369.994 ;;
   j) 	beep -f 391.995 ;;
   k) 	beep -f 415.305 ;;
   l)	beep -f 440.000 ;;
   ;)	beep -f 466.164 ;;
   p)	beep -f 493.883 ;;
   0 ) exit 0 
  esac
  clear
  echo "Teclado inicializado. Pulsa 0 para salir"
  
done
}

#Test function
#Beeps throughout a range of predetermined frequencies
function launchtest
{
echo -n "Testing"
beep -f 659 -l 460 -n -f 784 -l 340 -n -f 659 -l 230 -n -f 659 -l 110 -n -f 880 -l 230 -n -f 659 -l 230 -n -f 587 -l 230 -n -f 659 -l 460 -n -f 988 -l 340 -n -f 659 -l 230 -n -f 659 -l 110 -n -f 1047 -l 230 -n -f 988 -l 230 -n -f 784 -l 230 -n -f 659 -l 230 -n -f 988 -l 230 -n -f 1318 -l 230 -n -f 659 -l 110 -n -f 587 -l 230 -n -f 587 -l 110 -n -f 494 -l 230 -n -f 740 -l 230 -n -f 659 -l 700
echo "Done, press any key to contine"
read -n1
clear
}

#Beep install function
#It installs beep
function beepinstall
{
echo "This will install beep on your computer"
echo "Press ctrl+c to cancel installation"
sudo apt-get install beep
echo -n "Press any key to continue"
read -n1
clear
}

#Main menu loop
until [ "$choice" = 4 ]; do
echo -n "beep keyboard 0.1"
echo ""
echo "Main Menu"
echo "1.- Initialize keyboard"
echo "2.- Test system"
echo "3.- Install beep"
echo "4.- Exit"
read -n1 choice
case $choice in
  1 ) init ;;
  2 ) launchtest ;;
  3 ) beepinstall ;;
  4 ) exit 0;;
esac
done
