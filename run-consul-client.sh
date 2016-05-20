#!/bin/sh

NODENAME=$1
BIND_ADDRESS=$2
JOIN=$3

echo $NODENAME
echo $BIND_ADDRESS
echo $JOIN

docker run -d \
	--name=consul \
	--net=host \
	consul agent \
	-dc=local \
	-bind=$BIND_ADDRESS \
	-join=$JOIN
