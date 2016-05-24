# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.synced_folder ".", "/home/vagrant/sync", disabled: true

  config.vm.box = "centos/7"

  config.vm.define :node01 do |host|
    host.vm.hostname = "node01"
    host.vm.network "private_network", ip: "192.168.33.11"
    host.vm.provision :shell, path: "install-docker.sh"
    host.vm.provision :shell, path: "run-consul-server.sh", args: "node01 192.168.33.11 192.168.33.11"
  end

  config.vm.define :node02 do |host|
    host.vm.hostname = "node02"
    host.vm.network "private_network", ip: "192.168.33.12"
    host.vm.provision :shell, path: "install-docker.sh"
    host.vm.provision :shell, path: "run-consul-server.sh", args: "node02 192.168.33.12 192.168.33.11"
  end

  config.vm.define :node03 do |host|
    host.vm.hostname = "node03"
    host.vm.network "private_network", ip: "192.168.33.13"
    host.vm.provision :shell, path: "install-docker.sh"
    host.vm.provision :shell, path: "run-consul-client.sh", args: "node03 192.168.33.13 192.168.33.11"
    host.vm.provision :shell, path: "install-apache.sh"
  end

  config.vm.define :node04 do |host|
    host.vm.hostname = "node04"
    host.vm.network "private_network", ip: "192.168.33.14"
    host.vm.provision :shell, path: "install-docker.sh"
    host.vm.provision :shell, path: "run-consul-client.sh", args: "node04 192.168.33.14 192.168.33.11"
    host.vm.provision :shell, path: "install-apache.sh"
  end

end
