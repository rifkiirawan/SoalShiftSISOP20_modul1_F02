#! /bin/bash
read nama
< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c28 > $nama.txt; cat $nama.txt; echo
