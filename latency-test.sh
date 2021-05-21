#!/bin/bash

if [[ $# -lt 2 ]]
then
    echo "missing arguments"
    exit
fi

url="$1"
output="$2"
interval=0.5
num=100
if [[ $# -ge 3 ]]
then
    interval="$3"
fi

if [[ $# -eq 4 ]]
then
    num="$4"
fi

echo "recording response times for $num requests to $url made every $interval seconds into $output..."

rm "$output"

for (( count=0; count<num; count++ ))
do
    curl --insecure --silent --output "/dev/null" --write-out "%{time_total}\n" "$url" >> "$output" &
    sleep "$interval"
done
