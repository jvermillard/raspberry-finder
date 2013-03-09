#!/bin/sh

while true
do
    i=`ip addr show wlan0 | sed -n '3p' | awk '{ print $2 }' | cut -f 1 -d "/"`
    m=`ip addr show wlan0 | sed -n '2p'| awk '{ print $2 }'`
    h=`hostname`
    echo $i $m $h |socat - udp-datagram:255.255.255.255:5100,broadcast
done
