#!/bin/bash

while true; do
    ./piwfs-parallel.sh "$@"
    sleep 0.5

    ssh pi@$(cat ./master_ip.txt) "./piwfs/target/debug/piwfs master --time 70"
    sleep 2
done
