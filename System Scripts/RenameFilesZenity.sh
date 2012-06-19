#	Author: Rushyang Darji
#	Date: 04.08.2010
#	Last Build: 09.05.2012
#	This script is made with purpose of renaming bulk files.
#	
#

#rename=`zenity --entry --text='Enter the location of directory where rename is to perform:' --height=150 --width=600 --title='Enter location...'`
#if [[ "$rename" = '' || ! -d "$rename" ]]; then
#	zenity --error --text='Target path is empty. The script will now exit.' --no-wrap --timeout="3"
#	exit
#fi

base="`echo $NAUTILUS_SCRIPT_CURRENT_URI | cut -d'/' -f3- | sed 's/%20/ /g'`"
if [ -z "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS" ]; then
dir="$base/"
else
while [ ! -z "$1" -a ! -d "$base/$1" ]; do shift; done
dir="$base/$1/"
fi

rename=`echo -n $dir`

#cd "$rename" <-- Not working
#mkdir temp1
#temp="$rename/temp1"
#cd "$temp"
#mkdir final
#final="$temp/final"

prefix=`zenity --entry --text='Enter characters as prefix: ' --height=150 --width=600 --title='Enter Prefix...'`
#echo -n "Enter prefix characters: "
#read prefix
j=`zenity --entry --text='Enter the number where sequence starts from: ' --height=150 --width=600 --title='Starting point of Number sequence...'`
#echo -n "Enter the number where sequence starts from: "
#read j
if [[ "$j" = '' ]]; then
	j=1
fi
ext=`zenity --entery --text='Enter the file extension to loop in: ' --height=150 --width=600 --title='File Extension...'`
#echo -n "Enter the file extension to loop in:  "
#read ext

for i in "$rename"*."$ext"; do
          temp=$(mktemp "$rename"XXXXXX.temp1212)
          mv "$rename""$i" "$rename""$temp.$ext"
          rm "$rename""$temp"
done

for i in "$rename"*."$ext"; do
	#mv "$i" "$temp"
	#cd "$temp"
	mv "$rename""$i" "$rename""$prefix""$j"."$ext"
	#mv "$j"."$ex" "$final"
	#cd "$rename"
	#shift
	j=$(( $j+1 ))
done

#cd "$final"
#mv *."$ex" "$rename"
#cd 
#rmdir "$final"
#rmdir "$temp"

#ls "$rename" | sort -n

