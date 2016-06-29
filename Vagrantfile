# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.synced_folder ".", "/home/vagrant/sync", disabled: true

  config.vm.box = "centos/7"

  CONSUL_JOIN_ADDRESS = "192.168.33.11"

  config.vm.define :node01 do |host|
    _HOSTNAME = "node01"
    _PRIVATE_IP_ADDRESS = CONSUL_JOIN_ADDRESS
    _CONSUL_ARGS = _HOSTNAME + " " + _PRIVATE_IP_ADDRESS + " " + CONSUL_JOIN_ADDRESS

    host.vm.hostname = _HOSTNAME
    host.vm.network "private_network", ip: _PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "install-consul.sh"
    host.vm.provision :shell, path: "run-consul-server.sh", args: _CONSUL_ARGS
    host.vm.provision :shell, path: "set-dns.sh"
  end

  config.vm.define :node02 do |host|
    _HOSTNAME = "node02"
    _PRIVATE_IP_ADDRESS = "192.168.33.12"
    _CONSUL_ARGS = _HOSTNAME + " " + _PRIVATE_IP_ADDRESS + " " + CONSUL_JOIN_ADDRESS

    host.vm.hostname = _HOSTNAME
    host.vm.network "private_network", ip: _PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "install-consul.sh"
    host.vm.provision :shell, path: "run-consul-server.sh", args: _CONSUL_ARGS
    host.vm.provision :shell, path: "set-dns.sh"
  end

  config.vm.define :node03 do |host|
    _HOSTNAME = "node03"
    _PRIVATE_IP_ADDRESS = "192.168.33.13"
    _CONSUL_ARGS = _HOSTNAME + " " + _PRIVATE_IP_ADDRESS + " " + CONSUL_JOIN_ADDRESS

    host.vm.hostname = _HOSTNAME
    host.vm.network "private_network", ip: _PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "install-nginx.sh", args: _HOSTNAME
    host.vm.provision :shell, path: "install-consul.sh"
    host.vm.provision :shell, path: "run-consul-client.sh", args: _CONSUL_ARGS
    host.vm.provision :shell, path: "set-dns.sh"
  end

  config.vm.define :node04 do |host|
    _HOSTNAME = "node04"
    _PRIVATE_IP_ADDRESS = "192.168.33.14"
    _CONSUL_ARGS = _HOSTNAME + " " + _PRIVATE_IP_ADDRESS + " " + CONSUL_JOIN_ADDRESS

    host.vm.hostname = _HOSTNAME
    host.vm.network "private_network", ip: _PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "install-nginx.sh", args: _HOSTNAME
    host.vm.provision :shell, path: "install-consul.sh"
    host.vm.provision :shell, path: "run-consul-client.sh", args: _CONSUL_ARGS
    host.vm.provision :shell, path: "set-dns.sh"
  end

end
