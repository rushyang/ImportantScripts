#!/bin/bash
# This is one of my greatest creation to avoid catastrophic consequences!

checkanother()
{
cd '/media/Rushyang/test'
filecount=0
for i in *; do
	filesize=`du -m "$i" | awk '{ print $1 }'`
	if [[ -d "$i" ]]; then
		echo "$i skipped"
	else
		[[ "$filesize" -lt "20" ]] || filecount=$(($filecount+1))          
	fi
done

if [[ "$filecount" -eq "0" ]]; then
	 DISPLAY=:0.0 zenity --info --text="No need to execute the catastrophic consequences prevention script number 2\!" --title='You are not in danger!' --no-wrap --timeout="2"
	 break
fi

choice=`DISPLAY=:0.0 zenity --question --text="$filecount catastrophic open files were found in 2! Do you want to safe-guard it?" --ok-label="F**k, Yes!" --cancel-label='Leave my sh*t alone!' --title="Initiated the catastrophic consequences prevention script..." --no-wrap --timeout="15"; echo $?`

today=`date +%d%b%Y`
nrop='/media/Rushyang/Softwares/ZZZZZ/UltraEdit14.10.0.1024/UltraEdit14.10.0.1024/keYgeN/.IB/PSP/'
targetdir="$nrop/$today"
temp=$(mktemp)
trap "rm $temp" 0 1 2

if [[ "$choice" -eq "0" ]]; then
          [[ ! -d "$targetdir" ]] && mkdir "$targetdir" 2> "$temp"
          if [[ -s "$temp" ]]; then
          	echo "Script execution aborted" >> "$temp"
                    DISPLAY=:0.0 zenity --text-info --filename="$temp" --title="Error log.." --width=600 --height=600
                    break
          fi
   
	gocount=1
	for i in *; do
		if [[ -d "$i" ]]; then
			echo "$i skipped"
		else
			filesize=`du -m "$i" | awk '{ print $1 }'`
			if [[ "$filesize" -lt "20" ]]; then
				echo "nothing"
			else 
				mv "$i" "$targetdir" | DISPLAY=:0.0 zenity --progress --pulsate --auto-close --text="Moving file no $gocount out of $filecount" --title="$i" --width=500 --height=125 2>"$temp"
				gocount=$(($gocount+1))
				filecount=$(($filecount-1)) 
				[[ -s "$temp" ]] && DISPLAY=:0.0 zenity --text-info --filename="$temp" --title="Error log for $i" --width=600 --height=600
			fi
		fi
	done
elif [[ "$choice" -eq "5" ]]; then
	break
else
	break
fi
}

cd '/media/Rushyang/P'
filecount=0
for i in *; do
	filesize=`du -m "$i" | awk '{ print $1 }'`
	if [[ -d "$i" ]]; then
		echo "$i skipped"
	else
		[[ "$filesize" -lt "20" ]] || filecount=$(($filecount+1))          
	fi
done

if [[ "$filecount" -eq "0" ]]; then
	 DISPLAY=:0.0 zenity --info --text="No need to execute the catastrophic consequences prevention script number 1\!" --title='You are not in danger!' --no-wrap --timeout="2"
	 checkanother
	 exit
fi

choice=`DISPLAY=:0.0 zenity --question --text="$filecount catastrophic open files were found in 1! Do you want to safe-guard it?" --ok-label="F**k, Yes!" --cancel-label='Leave my sh*t alone!' --title="Initiated the catastrophic consequences prevention script..." --no-wrap --timeout="15"; echo $?`

today=`date +%d%b%Y`
nrop='/media/Rushyang/Softwares/ZZZZZ/UltraEdit14.10.0.1024/UltraEdit14.10.0.1024/keYgeN/.IB/mostrecent/'
targetdir="$nrop/$today"
temp=$(mktemp)
trap "rm $temp" 0 1 2

if [[ "$choice" -eq "0" ]]; then
          [[ ! -d "$targetdir" ]] && mkdir "$targetdir" 2> "$temp"
          if [[ -s "$temp" ]]; then
          	echo "Script execution aborted" >> "$temp"
                    DISPLAY=:0.0 zenity --text-info --filename="$temp" --title="Error log.." --width=600 --height=600
                    exit
          fi
   
	gocount=1
	for i in *; do
		if [[ -d "$i" ]]; then
			echo "$i skipped"
		else
			filesize=`du -m "$i" | awk '{ print $1 }'`
			if [[ "$filesize" -lt "20" ]]; then
				echo "nothing"
			else 
				mv "$i" "$targetdir" | DISPLAY=:0.0 zenity --progress --pulsate --auto-close --text="Moving file no $gocount out of $filecount" --title="$i" --width=500 --height=125 2>"$temp"
				gocount=$(($gocount+1))
				filecount=$(($filecount-1)) 
				[[ -s "$temp" ]] && DISPLAY=:0.0 zenity --text-info --filename="$temp" --title="Error log for $i" --width=600 --height=600
			fi
		fi
	done
	checkanother
elif [[ "$choice" -eq "5" ]]; then
	checkanother
	exit
else
	checkanother
	exit
fi

