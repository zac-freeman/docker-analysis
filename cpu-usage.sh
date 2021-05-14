#!/bin/bash

if [[ $# -lt 2 ]]
then
    echo "missing arguments"
    exit
fi

pid="$1"
output="$2"
interval=1
num=1000
if [[ $# -ge 3 ]]
then
    interval="$3"
fi

if [[ $# -eq 4 ]]
then
    num="$4"
fi

echo "recording CPU usage of process $pid $num times every 2*$interval seconds into $output..."

rm "$output"

for (( count=0; count<num; count++ ))
do
    top -b -n 2 -d "$interval" -p "$pid" | tail -1 | awk '{print $9}' >> "$output"
done
