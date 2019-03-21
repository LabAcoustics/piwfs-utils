#!/bin/bash

addr=$(nmap -sn 192.168.1.0/24 -oG - | sed "/^#/d" | cut -d' ' -f 2)

addr_ar=()
for address in $addr; do
  hostn=$(ssh -o ConnectTimeout=2 pi@$address 'hostname')
  if [[ $? == 0 ]]; then
    echo "Connected to $hostn at ip: $address"
    if [[ $hostn == master ]]; then
      echo $address > master_ip.txt     
    elif [[ $hostn == slave* ]]; then
      addr_ar[$(echo $hostn | cut -c 6-)]=$address 
    fi
  fi
done
echo ${addr_ar[*]} > slave_ip.txt
