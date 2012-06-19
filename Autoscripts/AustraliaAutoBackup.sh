#! /bin/bash
targetdir="/media/CYBER-BEAST/Rushyang/Personal Media"
[[ ! -d "$targetdir" ]] && exit
sourcedir1="/media/Rushyang/Personal Media/Australia"
sourcedir2="/media/Rushyang/Personal Media/Aarav"
temp=$(mktemp)
trap "rm $temp" 0 1 2
if [[ -d "$targetdir" ]]; then
	cp -uRv "$sourcedir1" "$targetdir" 1>>"$temp"
	cp -uRv "$sourcedir2" "$targetdir" 1>>"$temp"
fi

if [[ -s "$temp" ]]; then
	DISPLAY=:0.0 notify-send "CYBER-BEAST is attached! Auto Backup of Personal Media was successful!" -i gtk-dialog-info
fi
