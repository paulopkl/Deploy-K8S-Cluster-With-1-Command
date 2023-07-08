#!/bin/bash
n=1
while [ $n -lt 30 ]; do
    echo "instances are starting to run... Please wait $n/30 seconds"
    sleep 1s
    n=$((n+1))
done

echo "Provisioned :)"
