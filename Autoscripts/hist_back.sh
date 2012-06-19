#! /bin/bash
# Never parse the output of ls, that's why I used temp2.
#Fetchng today's date.
today=`date +%d%b%Y`
#now=`date +%d%b%Y_%H`
histdir="$HOME/Experiments/AutoHistBackup"
month=`date +%Y_%b`
path="$histdir/$month"
[[ -f "$path" ]] && exist=1
#cont=`ls "$path"/"$today"* | wc -l`
#[[ "$cont" -gt "0" ]] && exit

#choice=`zenity --question --text "Begin back up terminal history now?"; echo $?`
#[[ "$choice" -eq "1" ]] && exit

temp2=$(mktemp)
temp=$(mktemp history.XXXX)
temp3=$(mktemp)
trap "rm $temp3 $temp2" 0 1 2
cp "$HOME/.bash_history" "$temp"
cmp "$HOME/.bash_history" "$path/$today" 1> "$temp3" 2>&1
[[ ! -d $path ]] && mkdir -p "$path"
mv "$temp" "$path" #moving the temp file to backup directory
mv "$path/$temp" "$path/$today" #Renaming temp file to today's date

ls -c "$path/" >> "$temp2"
di=`cat "$temp2" | head -n1 | xargs`

#DISPLAY=:0.0 zenity --text-info --filename="$temp2" --timeout=5 --title="History backup completed!" --width=600 --height=600
if [[ -s "$temp3" && "$exist" -eq "1" ]]; then
	DISPLAY=:0.0 notify-send "History auto back up was successful! $di" -i gtk-dialog-info
fi
