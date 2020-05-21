#!/bin/bash

today=$(date +"%m%d")
year=$(date +"%y")

while IFS= read -r line
do
	IFS=$'\t' read -ra arr <<< "$line"
	for i in "${arr[@]}"
	do
		if [ "$i" == "$today" ]; then
			age=$(expr ${arr[2]} - $year)
			bday=$(echo ${arr[0]}"'s Birthday!!! ${arr[0]} is $year")
			notify-send "$bday"
		fi
	done
done < /home/daniel/Code/Birthday/birthdays.txt

