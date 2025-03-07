#!/bin/bash
read -p "enter a number between 1 and 3 inclusive>" character
if   [  "$character" = "1" ] ; then
       	echo "You entered one"
elif [ "$character" = "2" ] ; then
       	echo "You entered two"
elif [ "$character" = "3" ] ; then
       	echo "you entered three"
else 
	echo "you didn't not enter a number between 1 and 3"
fi
