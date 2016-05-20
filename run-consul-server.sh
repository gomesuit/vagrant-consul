#!/bin/sh

NODENAME=$1
BIND_ADDRESS=$2
JOIN=$3

echo $NODENAME
echo $BIND_ADDRESS
echo $JOIN

#/usr/local/bin/consul agent -server -dc=local -bootstrap-expect=2 -data-dir=/tmp/consul -node=$NODENAME -bind=$BIND_ADDRESS > /dev/null 2>&1

docker run -d \
	--name=consul \
	--net=host \
	-e 'CONSUL_LOCAL_CONFIG={"skip_leave_on_interrupt": true}' \
	consul agent \
	-server \
	-dc=local \
	-bind=$BIND_ADDRESS \
	-join=$JOIN \
	-bootstrap-expect=2
