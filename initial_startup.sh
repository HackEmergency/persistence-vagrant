#!/bin/bash
if [[ $(dpkg -l | grep puppet) == "" ]]
	then
	apt-get update
	apt-get install -y puppet
fi
