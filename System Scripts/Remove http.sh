#!/bin/bash

for i in *
do
	if [[ -f "$i" ]]; then
		fn=${i%".http"}
		mv "$i" "$fn"
	fi
done

