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

/usr/local/bin/consul agent \
	-data-dir=/tmp/consul \
	-node=$NODENAME \
	-dc=local \
	-bind=$BIND_ADDRESS \
	-join=$JOIN \
	 > /dev/null 2>&1 &
