#!/bin/bash

grep "Location" wget.log > location.log
readarray myarray < location.log

for i in {1..28}
do
	for j in {1..28}
	do
		if [ $i -eq $j ]
		then
			continue
		elif [ "${myarray[$i]}" = "${myarray[$j]}" ]
		then
			mv pdkt_kusuma_$i ./duplicate/duplicate_$i
		fi
	done
done
for i in {1..28}
do
	mv pdkt_kusuma_$i ./kenangan/kenangan_$i
done
cp wget.log wget.log.bak
