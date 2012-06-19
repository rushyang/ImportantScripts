#!/bin/bash
#Rushyang Darji
#Init Build: 26th May, 2012
# This script will search for files larger than 20MB in the given directory... and then add "_Rushyang" as the posfix to the name
read -e -p "Enter the path to directory: " sourced
[[ ! -d sourced ]] && exit
sourcefiles=()
while read -r -d $'\0'; do
	sourcefiles+=("$REPLY")
done < <(find "$sourced" -type f -size +20M -print0)

for i in "${sourcefiles[@]}"; do
	renameto="${i%.*}"
#	echo "$renameto"
	ext=$(echo $i |awk -F . '{if (NF>1) {print $NF}}')
#	echo "$ext"
	mv "$i" "$renameto"'_Rushyang.'"$ext"	
done
