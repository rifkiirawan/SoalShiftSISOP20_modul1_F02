#!/bin/bash

after="${1%.*}"

lasttime=$(date +%H -r $1)

atas=`expr $lasttime + 98`
bawah=`expr $lasttime + 97`

chr() {
  printf "\\$(printf '%03o' "$1")"
}

upper=`chr $atas`
lower=`chr $bawah`

before=`printf "$after" | tr $upper-za-$lower${upper^^}-ZA-${lower^^} b-zaB-ZA`

mv $after.txt $before.txt
