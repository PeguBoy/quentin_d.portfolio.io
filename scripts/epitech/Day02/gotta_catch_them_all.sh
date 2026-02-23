#!/bin/bash
#grep -o " $1" |  wc -l
sed "s/:/\n/g" | grep -v "/" | grep " $1" | wc -l
