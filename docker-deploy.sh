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

dockerBuild () 
{
	logger STEP "Docker build process for JDK 8 ..."
	docker build . -t ubuntu-jdk:latest
	RET=$?
	if [[ $RET -ne 0 ]] ; then
		echo "Docker build process failed"
	else
		echo "Docker build process passed"
	fi
}

dockerRun()
{
	logger STEP "Run Docker container of JDK 8 ..."
	docker run -itd --name helloworld -p 8080:8080 ubuntu-jdk:latest
	RET=$?
	if [[ $RET -ne 0 ]] ; then
		echo "Docker run process failed"
	else
		echo "Docker container executed successfully"
	fi
	
}
dockerBuild
dockerRun
