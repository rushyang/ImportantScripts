file1=`zenity --file-selection`
echo "$file1"

total=`grep "http" "$file1" | wc -l`
i=0
while read -r line
do
	line2=`echo $line | grep http`
	if [[ "$line2" != '' ]]; 	then
		firefox "$line2" 1>/dev/null 2>&1 &
		total=$(( $total-1 ))
		i=$(( $i+1 ))
		echo "$i down, $total to go"
		sleep 1
	fi
done < "$file1"
