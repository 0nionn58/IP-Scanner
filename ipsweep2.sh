#!/bin/bash

read -p 'Choose a subnet:
1) 255.0.0.0
2) 255.255.0.0
>' subnet

echo $subnet

while [ "$subnet" != "1" ] && [ "$subnet" != "2" ]; do
	read -p 'Choose a subnet:
1) 255.0.0.0
2) 255.255.0.0
>' subnet
done

if [ "$subnet" == "1" ]; then
	echo "Finding IPs from 10.0.0.0/8..."
	for ip in `seq 1 254`; do
		for ip2 in `seq 1 254`; do
			for ip3 in `seq 1 254`; do
				ping -c 1 -w 5 "10.$ip.$ip2.$ip3" | grep "64 bytes" | cut -d " " -f 4 | tr -d ":"
				echo "scanning..." 
			done
		done
	done
else
	echo "Finding IPs from 192.168.0.0/24..."
	for ip in `seq 1 254`; do
		for ip2 in `seq 1 254`; do
			ping -c 1 -w 1 "192.168.$ip.$ip2" | grep "64 bytes" | cut -d " " -f 4 | tr -d ":"
			echo "scanning..."
		done
	done
fi
