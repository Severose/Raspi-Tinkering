#!/bin/bash

display_usage() {
	echo -e "\nUsage:\n$0 <email address> \n"
}

if [ $# -le 1 ]
then
	display_usage
	exit 1
fi

if [[ ( $# == "-h") || $# == "--help" ]]
then
	display_usage
	exit 0
fi

# Generate new SSH key pair
ssh-keygen -t rsa -b 4096 -C $1
