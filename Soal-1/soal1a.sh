#!/bin/bash
awk -F "\t" 'NR>1 {a[$13]+=$21;}END{min=1000000; for(i in a) {if(min > a[i]) {min=a[i]; place=i;}} print place", "min;}' Sample-Superstore.tsv
