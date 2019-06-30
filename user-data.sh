#!/bin/bash
#
# Copyright (c) 2018, Saket. All rights reserved.
#
#    NAME
#      Dockerinstall.sh
#
#    DESCRIPTION
#      Install docker on Ubuntu and spawn container of helloworld provided by Jiffle

logger ()
{
	level="${1}"
	msg="${2}"
	echo -e "**************** $(date "+%d/%m/%Y %H:%M:%S") ::: ${level} ::: ${msg} ****************"
	
	if [ $# -gt 2 ];  then
		exit 1
	fi
}

installDocker ()
{
	logger STEP "installing Docker ..."
    RESPONSE=$(docker -v)
	RET=$?
	if [[ $RET -ne 0 ]] ; then
		echo "Installing docker package on host"
		sudo apt update
		sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg-agent -y
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
		sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
		sudo apt update
		sudo apt install docker-ce docker-ce-cli containerd.io -y
		sudo systemctl status docker
	else
		echo "Docker is already installed"
	fi
}

installDocker
