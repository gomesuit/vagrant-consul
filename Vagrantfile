# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.synced_folder ".", "/home/vagrant/sync", disabled: true

  config.vm.box = "centos/7"

  config.vm.define :node01 do |host|
    HOSTNAME = "node01"
    PRIVATE_IP_ADDRESS = "192.168.33.11"
    CONSUL_JOIN_ADDRESS = "192.168.33.11"
    CONSUL_ARGS = HOSTNAME + " " + PRIVATE_IP_ADDRESS + " " + CONSUL_JOIN_ADDRESS

    host.vm.hostname = HOSTNAME
    host.vm.network "private_network", ip: PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "install-consul.sh"
    host.vm.provision :shell, path: "run-consul-server.sh", args: CONSUL_ARGS
    host.vm.provision :shell, path: "set-dns.sh"
  end

  config.vm.define :node02 do |host|
    HOSTNAME = "node02"
    PRIVATE_IP_ADDRESS = "192.168.33.12"
    CONSUL_JOIN_ADDRESS = "192.168.33.11"
    CONSUL_ARGS = HOSTNAME + " " + PRIVATE_IP_ADDRESS + " " + CONSUL_JOIN_ADDRESS

    host.vm.hostname = HOSTNAME
    host.vm.network "private_network", ip: PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "install-consul.sh"
    host.vm.provision :shell, path: "run-consul-server.sh", args: CONSUL_ARGS
    host.vm.provision :shell, path: "set-dns.sh"
  end

  config.vm.define :node03 do |host|
    HOSTNAME = "node03"
    PRIVATE_IP_ADDRESS = "192.168.33.13"
    CONSUL_JOIN_ADDRESS = "192.168.33.11"
    CONSUL_ARGS = HOSTNAME + " " + PRIVATE_IP_ADDRESS + " " + CONSUL_JOIN_ADDRESS

    host.vm.hostname = HOSTNAME
    host.vm.network "private_network", ip: PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "install-consul.sh"
    host.vm.provision :shell, path: "run-consul-client.sh", args: CONSUL_ARGS
    host.vm.provision :shell, path: "set-dns.sh"
    host.vm.provision :shell, path: "install-nginx.sh", args: HOSTNAME
  end

  config.vm.define :node04 do |host|
    HOSTNAME = "node04"
    PRIVATE_IP_ADDRESS = "192.168.33.14"
    CONSUL_JOIN_ADDRESS = "192.168.33.11"
    CONSUL_ARGS = HOSTNAME + " " + PRIVATE_IP_ADDRESS + " " + CONSUL_JOIN_ADDRESS

    host.vm.hostname = HOSTNAME
    host.vm.network "private_network", ip: PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "install-consul.sh"
    host.vm.provision :shell, path: "run-consul-client.sh", args: CONSUL_ARGS
    host.vm.provision :shell, path: "set-dns.sh"
    host.vm.provision :shell, path: "install-nginx.sh", args: HOSTNAME
  end

end
