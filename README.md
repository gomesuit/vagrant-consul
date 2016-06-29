# vagrant-consul

## memberの確認
```
consul members
```

## DNSの確認
```
yum install bind-utils
dig node02.node.consul
ping node02 -c 3
```

## コマンド実行確認
```
consul exec hostname
```
