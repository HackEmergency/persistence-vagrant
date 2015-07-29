#!/bin/bash
if [ ! -d "keys" ] 
	then
	if [[ $(pip freeze | grep digitalocean) == "" ]]
		then
		echo "installing digitalocean package"
		pip install python-digitalocean
	fi
	python delete_vagrant_keys.py
	mkdir keys
	ssh-keygen -t rsa -f keys/persistence -N ''
fi