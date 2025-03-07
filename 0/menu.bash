#!/bin/bash

press_enter(){
	echo -en "\nPress Enter to continue"
	read 
	clear
}
while true; do
	echo "
    PROGRAM MENU
    1 - Display free disk space
    2 - Display free memory

    0 - exit program
"
  read -n 1 -p "Enter selection: " selection
  echo ""

     case "$selection" in
        1 ) df 
		press_enter
		;;
        2 ) free
	       press_enter
       	       ;;
	0 ) break
	      	;;
        * )  echo "Please enter 1, 2, or 0"
		press_enter
		;;
esac
done
