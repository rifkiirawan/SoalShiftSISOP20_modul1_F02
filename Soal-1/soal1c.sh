#!bin/bash
awk -F "\t" 'NR>1 { if( ( $11=="Illinois" || $11=="Texas" ) && $13=="Central" ) { a[$17]+=$21; }} END { for(i in a) print i"="a[i] | "sort -t '=' -g -k2" }' Sample-Superstore.tsv | head -n 10
