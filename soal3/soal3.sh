#!/bin/bash
for i in {1..28}
do
	wget "https://loremflickr.com/320/240/cat" -O "/home/evelyn/Praktikum1/pdkt_kusuma_$i" -a "/home/evelyn/Praktikum1/wget.log"
done

5 6-23/8 * * 1-5,7 /bin/bash /home/evelyn/Praktikum1/soal3a.sh

for i in {1..28}
do
	for j in {1..28}
	do
		if [ $i -eq $j ]
		then
			continue
		elif cmp -s "pdkt_kusuma_$i" "pdkt_kusuma_$j"
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
