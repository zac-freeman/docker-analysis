#!/bin/bash

if [[ $# -lt 1 ]]
then
    echo "missing url argument"
    exit
fi

url="$1"
interval=0.1
if [[ $# -eq 2 ]]
then
  interval="$2"
fi

echo "making requests to $url every $interval seconds..."

while true
do
    curl --insecure --silent "$url" &
    sleep "$interval"
done
