#!/bin/bash

after="${1%.*}"

jam=$(date +%H -r $1)

while [ $jam -gt 0 ]
do
 before=$(echo $after | tr '[B-ZAb-za]' '[A-Za-z]')
 jam=$((jam-1))
done

mv $after.txt $before.txt
