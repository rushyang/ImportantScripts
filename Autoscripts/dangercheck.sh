#!/bin/bash
var1=`ls "/media/Rushyang/P/"`
var2=`ls "/media/Rushyang/test/"`

filecount=0
cd '/media/Rushyang/P'
for i in *; do
	if [[ -d "$i" ]]; then
		echo "nothing"
	else
		filesize=`du -m "$i" | awk '{ print $1 }'`
		[[ "$filesize" -lt "20" ]] || filecount=$(($filecount+1))          
	fi
done

cd '/media/Rushyang/test'
for i in *; do
	if [[ -d "$i" ]]; then
		echo "nothing"
	else
		filesize=`du -m "$i" | awk '{ print $1 }'`
		[[ "$filesize" -lt "20" ]] || filecount=$(($filecount+1))          
	fi
done

[[ "$filecount" -ne "0" ]] && DISPLAY=:0.0 notify-send "You're on the edge of potential catastrophic danger"'!' -i gtk-dialog-error

