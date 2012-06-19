#! /bin/bash
targetdir="/media/Rushyang/backup/"
temp=$(mktemp)
trap "rm $temp" 0 1 2
if [[ ! -d "$targetdir" ]]; then 
	DISPLAY=:0.0 zenity --error --text="Unable to locate $targetdir for backup! Script will now exit" 
	exit
fi
sourcedir1="/home/rushyang/Experiments/"
sourcedir2="/home/rushyang/Working/"
now=`date +%d%b%Y_%H`
echo '************Update Log for'"$now"'************'
if [[ -d "$targetdir" ]]; then
	cp -uRv "$sourcedir1" "$targetdir" 1>"$temp" 2>&1
	cp -uRv "$sourcedir2" "$targetdir" 1>"$temp" 2>&1
fi

if [[ -s "$temp" ]]; then
	DISPLAY=:0.0 notify-send "Some new Scripts were found. Has backed up successfully." -i gtk-dialog-info
fi
