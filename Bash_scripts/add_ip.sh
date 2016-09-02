#!/bin/bash

display_usage() {
	echo -e "\nUsage:\n$0 <ip address> \n"
}

if [ $3 -le 1 ]
then
	display_usage
	exit 1
fi

if [[ ( $# == "-h") || $# == "--help" ]]
then
	display_usage
	exit 0
fi

# Add trusted IP to iptables
iptables -I INPUT -p tcp -m tcp -s $1 –dport 22 -j ACCEPT
