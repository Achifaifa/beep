#!/bin/bash

#Global variables. 
rec=0 		#recording on (1) or off (0). Redundant with recread
recmenu="on" 	#recread negated. Used in the main menu
recread="off"	#recording status (on or off)
note=		#Name of the note pressed (This goes to the log)

#Fliprecord switches the recording variables on and off
function fliprecord
{
  
  if [ "$rec" = "1" ]; then 
    rec=0
    recread="off"
    recmenu="on"
    menu
  else 
    rec=1 
    recread="on"
    recmenu="off"
    menu
  fi
 
}

#Appendnote function adds a note to the log
function appendnote
{
  if [ "$rec" = "1" ]; then 
    echo "$note">> $HOME/BeepBeep
  fi
}

#Main keyboard function
function init 
{
  #This inserts an emptly line in the record file so different sessions can be identified
  echo "__Session separator__">> $HOME/BeepBeep
  #Reset yek and freq variables
  yek=
  freq=
  
  echo "Keyboard initialized. Press 0 to return to the menu"
  echo "Recording is $recread"
      
  until [ "$yek" = 0 ]; do
  
    #define local variables. 
    #yek: key pressed
    local yek="$@"
    #freq: frequencly
    local freq=0
    read -n1 yek
  
    #Depending on which key is pressed, it asigns different frequency values to the variable...
    case "$yek" in
      a)	freq=261.626 ; note="C"		; echo $note	; appendnote ;;
      w)	freq=277.183 ; note="C# / Db"	; echo $note	; appendnote ;;
      r)	freq=293.665 ; note="D"		; echo $note	; appendnote ;;
      f)	freq=311.127 ; note="D# / Eb"	; echo $note	; appendnote ;;
      s)	freq=329.628 ; note="E"		; echo $note	; appendnote ;;
      t)	freq=349.228 ; note="F"		; echo $note	; appendnote ;;
      g)	freq=369.994 ; note="F# / Gb"	; echo $note	; appendnote ;;
      d)	freq=391.995 ; note="G"		; echo $note	; appendnote ;;
      j)	freq=415.305 ; note="G# / Ab"	; echo $note	; appendnote ;;
      h)	freq=440.000 ; note="A"		; echo $note	; appendnote ;;
      l)	freq=466.164 ; note="A# / Bb"	; echo $note	; appendnote ;;
      n)	freq=493.883 ; note="B"		; echo $note	; appendnote ;;
      0)	menu ; yek= ;; #Removing the 0 from the yek variable. This prevents the keyboard function from exiting automatically next time.
      
      #Establish a minimum frequency to avoid beep error messages in the note stream
      *)	freq=1 ;;
      
    esac
  
  #And then we make the thing beep with that frequency
  beep -f $freq
  
  done
}

#Test function
#Beep beep beepbeep beepbeepbeep beep beep beepbeepbeepbeepbeep beep beep beep bebeep bebeep beep beeep
function launchtest
{
  echo "Testing"
  beep -f 659 -l 460 -n -f 784 -l 340 -n -f 659 -l 230 -n -f 659 -l 110 -n -f 880 -l 230 -n -f 659 -l 230 -n -f 587 -l 230 -n -f 659 -l 460 -n -f 988 -l 340 -n -f 659 -l 230 -n -f 659 -l 110 -n -f 1047 -l 230 -n -f 988 -l 230 -n -f 784 -l 230 -n -f 659 -l 230 -n -f 988 -l 230 -n -f 1318 -l 230 -n -f 659 -l 110 -n -f 587 -l 230 -n -f 587 -l 110 -n -f 494 -l 230 -n -f 740 -l 230 -n -f 659 -l 700
  echo "Done, press any key to contine"
  read -n1
  clear
}

#Beep install function
#It installs beep (Debian)
function beepinstall
{
  echo "This will install beep on your computer"
  echo "Press ctrl+c to cancel installation"
  sudo apt-get install beep
  echo -n "Press any key to continue"
  read -n1
  clear
}

#Main menu function
function menu
{
  local choice=		#Initialize menu choice variable (Just in case)
  clear
  until [ "$choice" = 0 ]; do
    echo "BeepBeep keyboard 0.3 - Main menu"
    echo ""
    echo "1.- Initialize keyboard"
    echo "2.- Test system"
    echo "3.- Install beep"
    echo "4.- Turn recording $recmenu (Currently $recread)" 
    echo "---"
    echo "0.- Salir"
    read -n1 choice
    case $choice in
      1 ) clear; choice="0" ; init ;;
      2 ) clear; choice="0" ; launchtest ;;
      3 ) clear; choice="0" ; beepinstall ;;
      4 ) clear; choice="0" ; fliprecord ;;
      0 ) clear; exit 0;;
      
      #This prevents menu from displaying the menu twice:
      * ) echo "Not a valid option. Press any key to continue" ; read -n1 ; menu ;;
    esac
  done
}

menu