#!/bin/bash

if [ "$1" == "" ]; then
echo "You forgot an IP address!"
echo "syntax: ./ipsweep.sh 192.168"

else
for ip in `seq 1 254`; do
for ip2 in `seq 1 254`; do
ping -c 1 "$1.$ip.$ip2" | grep "64 bytes" | cut -d " " -f 4 | tr -d ":"&
done
done
fi