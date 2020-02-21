#!/bin/bash
awk -F "\t" 'NR>1 {a[$13]+=$21;}END{min=1000000; for(i in a) {if(min > a[i]) {min=a[i]; place=i;}} print place", "min;}' Sample-Superstore.tsv

awk -F "\t" 'NR>1 {if( $13=="Central" ) { a[$11]+=$21 }} END { for(i in a) print i","a[i] | "sort -t ',' -g -k2"}' Sample-Superstore.tsv | head -n 2

awk -F "\t" 'NR>1 { if( ( $11=="Illinois" || $11=="Texas" ) && $13=="Central" ) { a[$17]+=$21; }} END { for(i in a) print i"="a[i] | "sort -t '=' -g -k2" }' Sample-Superstore.tsv | head -n 10
