#! /bin/bash
pass=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c28 | head -n 1)

while true; do
if [[ $1 =~ ^[A-Za-z]+$ ]];then
	file="$1.txt"
	echo "$pass" > "$file"
	break
	else
	echo "HURUF ONLY"
	break
	fi
done
