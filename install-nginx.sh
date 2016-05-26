#!/bin/sh

NODENAME=$1
echo $NODENAME

yum install -y epel-release nginx
systemctl start nginx

echo $NODENAME > /usr/share/nginx/html/consul.html
