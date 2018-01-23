#!/bin/bash

docker build \
	--build-arg LOCAL_USER_NAME=$USER \
	--build-arg LOCAL_USER_UID=$UID \
	-t local-aws-base \
	.


