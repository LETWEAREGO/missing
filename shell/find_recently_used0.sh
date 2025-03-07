#!/bin/bash
if [ "$#" -ne 1 ]; then 
	echo "usage : $0 <directory>"
	exit 1
fi
directory=$1
if [ ! -d "$directory" ]; then 
	echo "The specified directory does not exist."
	exit 1
fi
find "$directory" -type f -exec ls -ltu {} + | head -n 1

