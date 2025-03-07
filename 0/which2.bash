#!/bin/bash

read -p "enter a number between 1 and 3 inclusive> " character

if [ -z "$character" ]; then
    echo "You did not enter anything"
elif [ "$character" = "1" ]; then
    echo "You entered one"
elif [ "$character" = "2" ]; then
    echo "You entered two"
elif [ "$character" = "3" ]; then
    echo "You entered three"
else
    echo "You did not enter a number between 1 and 3"
fi
