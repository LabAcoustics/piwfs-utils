#!/bin/bash

filen=$1

addr_ar=($(cat slave_ip.txt))
for it in $(seq 0 $((${#addr_ar[@]}-1))); do
  hostn=slave$((it + 1))
  address=${addr_ar[it]}
  echo "Connection to $hostn at ip: $address"
  rsync -P $filen-$hostn.wav pi@$address:/home/pi
done
