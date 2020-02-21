#!/bin/bash

before=$1

jam=`date "+%H"`

while [ $jam -gt 0 ]
do
 after=$(echo $before | tr '[A-Za-z]' '[B-ZAb-za]')
 jam=$((jam-1))
done

mv $before.txt $after.txt
