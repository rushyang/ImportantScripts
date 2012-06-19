# This script will copy each link into clipboard with the 10 seconds of pause between each.
# Damn! I'm good!! :) 
#read -e -p "Enter Absolute path to file: " file1

file1=`zenity --file-selection`

[[ ! -f "$file1" ]] && exit
lines=`cat "$file1" | wc -l`
i=1
while read -r line 
do
	echo "$line" | xclip -selection clipboard
	lines=$(( $lines-1 ))
	echo "$i down, $lines to go"
	i=$(( $i+1 ))
	sleep 10
done < "$file1"
