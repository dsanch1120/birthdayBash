#!/bin/bash

today=$(date +"%m%d")
year=$(date +"%Y")

while IFS= read -r line
do
	IFS=$'\t' read -ra arr <<< "$line"
	for i in "${arr[@]}"
	do
		if [ "$i" == "$today" ]; then
			age=$(expr $year - ${arr[2]})
			bday=$(echo ${arr[0]}"'s Birthday!!! ${arr[0]} is $age")
			notify-send "$bday"
		fi
	done
done < /home/daniel/Code/Birthday/birthdays.txt

