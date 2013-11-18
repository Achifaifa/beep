#!/bin/bash

choice=

#Main keyboard function
function init 
{ exit 0
}

#Test function
#Beeps throughout a range of predetermined frequencies
function launchtest
{
echo -n "Testing"
beep -f 261.626
beep -f 277.183
beep -f 293.665 
beep -f 311.127
beep -f 329.628
beep -f 349.228
beep -f 369.994
beep -f 391.995 
beep -f 415.305 
beep -f 440.000 
beep -f 466.164 
beep -f 493.883  
echo "Done, press enter to contine"
read
clear
}

#Beep install function
#It installs beep
function beepinstall
{
echo "This will install beep on your computer"
echo ""
echo "Press ctrl+c to cancel installation"
sudo apt-get install beep
echo -n "Press enter to continue"
read 
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
read choice
case $choice in
  1 ) init ;;
  2 ) launchtest ;;
  3 ) beepinstall ;;
  4 ) exit 0;;
esac
done
