#<< -- This script will remove all history of echo from once's history usage.
# Author: Rushyang Darji
# Init Build: 15082010
# Last Build: 19082010
# Version: 1.3
# Version history:
# v1.3: Added uniq command list
: << --
cd $HOME
today=`date +%d%m%Y`
backdir='/home/rushyang/historybackup'

touch $backfile
if [ -d $backdir ]; then
	cp .bash_history $backdir
else
	mkdir -p $backdir
	cp .bash_history $backdir
fi
cd $backdir
mv .bash_history $today
--
cd $HOME

cat .bash_history | grep -v -e ^echo -v -e ^e$ -v -e ^c$ -v -e ^ls -v -e ^cat > .bash_history_backup
rm .bash_history
mv .bash_history_backup .bash_history

if [ $? -eq 0 ]; then
	echo "Useless commands were removed out of the histroy!"
	#sleep 1
else
	echo "Something's wrong"
fi



