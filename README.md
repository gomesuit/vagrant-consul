# vagrant-consul

## memberの確認
```
consul members
```

## DNSの確認
```
yum install bind-utils
dig server02.node.consul
ping server02 -c 3
dig web.service.consul
```

## コマンド実行確認
```
consul exec hostname
```

## WEBサーバ動作確認
```
curl http://node01/consul.html
curl http://node02/consul.html
curl http://web.service.consul/consul.html
consul exec -node="node01" systemctl stop nginx
curl http://web.service.consul/consul.html
consul exec -node="node01" systemctl start nginx
consul exec -node="node02" systemctl stop nginx
curl http://web.service.consul/consul.html
```
