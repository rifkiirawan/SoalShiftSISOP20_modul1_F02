#!/bin/bash

before=$1

jam=`date "+%H"`

big=`expr $jam + 98`
smol=`expr $jam + 97`

chr() {
printf "\\$(printf '%03o' "$1")"
}

upper=`chr $big`
lower=`chr $smol`

after=`printf "$before" | tr b-zaB-ZA $upper-za-$lower${upper^^}-ZA-${lower^^}`

mv $before.txt $after.txt
