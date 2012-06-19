#!/bin/bash
#This script is made to Google quickly!
#Author: Rushyang Darji
#Date: 3rd June, 2012
# Damn! I'm Good. :D 
gstring=`zenity --entry --text="Enter the string to search it with google: " --title="Initiating Google it Script.." --width=600`
if [ -z "$gstring" ]; then
	exit
fi
firefox "https://www.google.co.in/#hl=en&safe=off&output=search&sclient=psy-ab&q=""$gstring""&oq=""$gstring""&ie=utf-8&oe=utf-8"
#firefox "https://www.google.com/search?client=ubuntu&channel=fs&q=TEST&ie=utf-8&oe=utf-8
