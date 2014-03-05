#!/bin/bash
# This script will sum the "Total" speeds that are put out in every test.

READ_FILE=$1

results=$(cat $READ_FILE | grep Total: | sed -e "s/\[.*\] Total: //g" | sed -e "s/khash\/s//g")

total=0
elements=0
for i in ${results[@]}; do
  total=`echo $total + $i | bc`
  elements=$(($elements+1))
done

average=$(echo $total / $elements |bc -l)

echo "$READ_FILE Average: $average"
