#!/bin/bash

if [[ $# -lt 2 ]]
then
    echo "missing arguments"
    exit
fi

url="$1"
output="$2"
num=100
if [[ $# -eq 3 ]]
then
    num="$3"
fi

echo "recording response times for $num requests to $url into $output..."

rm "$output"

for (( count=0; count<num; count++ ))
do
    curl --insecure --silent --output "dev/null" --write-out "%{time_total}\n" "$url" >> "$output"
done
