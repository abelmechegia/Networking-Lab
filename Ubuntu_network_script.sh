#!/usr/bin/bash


echo "IP address:   "
ip a | grep "inet" | awk '{print $2}'



echo "DNS server:  "
cat /etc/resolv.conf | grep "nameserver"



echo "Open Ports on the server:    "
sudo netstat -tuln | grep LISTEN



echo "Routing Table:   "
ip route



echo "Network Interfaces:    "
ip link show
