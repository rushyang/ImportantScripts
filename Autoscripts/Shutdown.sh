#!/bin/bash
DISPLAY=:0.0 notify-send "You're about to get Shutdown warning in next 2 minutes." -i gtk-dialog-info
sleep 60
DISPLAY=:0.0 notify-send "You're about to get Shutdown warning in next 1 minute." -i gtk-dialog-info
sleep 60

choice=`DISPLAY=:0.0 zenity --question --text="Computer will shutdown in 15 seconds." --ok-label="Go Ahead, Do it" --cancel-label='Cancel it!' --title="Initiated Shutdown Cron.." --timeout="15"; echo $?`

if [[ "$choice" -eq "0" || "$choice" -eq "5" ]]; then
	DISPLAY=:0.0 zenity --info --text="I am in shutdown zone" --timeout="2"
	sudo /sbin/shutdown -h now
else
	exit
fi
