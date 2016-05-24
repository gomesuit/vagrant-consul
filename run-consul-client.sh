#!/bin/sh

NODENAME=$1
BIND_ADDRESS=$2
JOIN=$3

echo $NODENAME
echo $BIND_ADDRESS
echo $JOIN


mkdir -p ~/consul.d

cat <<EOF > /root/consul.d/web.json
{
	"service": {
		"name": "web",
		"tags": ["rails"],
		"port": 80,
		"check": {
			"script": "curl localhost:80 > /dev/null 2>&1",
			"interval": "10s"
		}
	}
}
EOF

consul agent \
	-node=$NODENAME
	-v /root/consul.d:/consul/config
	-dc=local \
	-bind=$BIND_ADDRESS \
	-join=$JOIN

