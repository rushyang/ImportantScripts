sourced='/home/rushyang/Desktop/Corrupted_file_rebuild'
sourcefiles=()

while read -r line
do
     sourcefiles+=("$line")
done < "$sourced"

temp=$(mktemp $HOME/Desktop/justfiles.XXX)
for i in "${sourcefiles[@]}"; do
	dirname1=`dirname "$i"`
	basename1=`basename "$dirname1"`
	echo "$basename1" >> "$temp"
done
