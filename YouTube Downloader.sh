#!/bin/bash
# Step 1: Use the GrabClipContent Script to grab the youtube video links you want to download
# Step 2: Save them in a particular file, run this script and show that file. That's it.
file1=`zenity --file-selection`
[[ ! -f "$file1" ]] && exit
lines=`cat "$file1" | wc -l`
i=1
while read -r line; do
	youtube-dl --rate-limit=250k --retries=10 -c -t "$line"
	#--batch-file option also can be used -o "%(stitle)s"
	lines=$(( $lines-1 ))
	echo "$i down, $lines to go"
	i=$(( $i+1 ))
done < "$file1"
