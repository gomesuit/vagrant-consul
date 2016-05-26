#!/bin/sh

NODENAME=$1
BIND_ADDRESS=$2
JOIN=$3

echo $NODENAME
echo $BIND_ADDRESS
echo $JOIN

mkdir -p /root/consul.d

cat <<EOF > /root/consul.d/web.json
{
	"service": {
		"name": "web",
		"tags": ["nginx"],
		"port": 80,
		"check": {
			"script": "curl http://127.0.0.1:80/consul.html >/dev/null 2>&1",
			"interval": "10s",
			"timeout": "5s"
		}
	}
}
EOF

cat <<EOF > /root/consul.d/agent.json
{
	"ports": {
		"dns": 53
	},
	"recursor": "8.8.8.8"
}
EOF

/usr/local/bin/consul agent \
	-config-dir=/root/consul.d \
	-data-dir=/tmp/consul \
	-node=$NODENAME \
	-dc=local \
	-bind=$BIND_ADDRESS \
	-join=$JOIN \
	 > /dev/null 2>&1 &
