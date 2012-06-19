#!/bin/bash

read -e -p "Enter the Source Directory: " sourced
read -e -p "Enter the Destination Directory: " destn

sourcefiles=()
while read -r -d $'\0'; do
	sourcefiles+=("$REPLY")
done < <(find "$sourced" -type f -print0)
# Finally, the < <(..) syntax is the combinations of file Redirection (<) and Process Substitution (<(..)) which is used to redirect the output of the find command into our while loop.

destfiles=()
while read -r -d $'\0'; do
	destfiles+=("$REPLY")
done < <(find "$destn" -type f -print0)

temp=$(mktemp)
trap "rm $temp; exit" 1 2
totalfiles=0
for i in "${sourcefiles[@]}"; do
#	echo "Looping " "$i"
	base1=`basename "$i"`
	for j in "${destfiles[@]}"; do
		base2=`basename "$j"`
		
		#echo "Base1: $base1"
		#echo "Base2: $base2"
		#[[ "$base1" != "$base2" ]] && break
		if [[ "$base1" = "$base2" ]]; then
			#echo "Looping " "$base1" " with " "$base2"
			size1=`ls -l "$i" | awk '{print $5}'`
			size2=`ls -l "$j" | awk '{print $5}'`
			if [[ "$size1" != "$size2" ]]; then
				echo '' 
				echo ''
				echo '########## Found corrupted file! ############'
				#echo "$j"
				#echo "$j" >> "$temp"
				sleep 3
				open=`dirname "$j"`
				cmoviename=`basename "$open"`
				echo "$cmoviename" >> "$temp"
				nautilus "$open" & 
				sleep 5
				echo ''
				echo ''
			fi
			if [[ "$size1" = "$size2" ]]; then
				echo `dirname "$j"` '/' "$base2"
				echo "File is okay! Congratulations!"
				sleep 1
			fi
		fi
	done
done

if [[ -s "$temp" ]]; then
	mv "$temp" $HOME/Desktop/'Corrupted_files'
fi
