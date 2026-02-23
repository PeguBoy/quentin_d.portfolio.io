#!/bin/bash
MY_LINE1=$1
MY_LINE2=$2 
sed -e 's/shell /shell\n/g' | grep -o -e '^[a-z]*_\?[a-z]' | rev | sed 'n;d' | sort -r |sed -n "${MY_LINE1},${MY_LINE2}p;" |paste -s -d ',' | sed  's/$/./g'
