#!/bin/bash

cmd=$1
addr_ar=($(cat slave_ip.txt))
for it in $(seq 0 $((${#addr_ar[@]}-1))); do
  hostn=slave$((it + 1))
  address=${addr_ar[it]}
  echo "Connection to $hostn at ip: $address"
  ssh pi@$address "$cmd"&
done
