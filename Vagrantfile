# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure '2' do |config|
  config.vm.box = 'ubuntu/focal64'

  config.vm.provision :file, source: 'files/yggdrasil',      destination: 'yggdrasil'
  config.vm.provision :file, source: 'files/yggdrasilctl',   destination: 'yggdrasilctl'
  config.vm.provision :file, source: 'files/yggdrasil.conf', destination: 'yggdrasil.conf'

  config.vm.provision :shell, privileged: false, inline: <<~PROVISION
    sudo apt-get update
    sudo apt-get upgrade --yes
    sudo apt-get install git golang --yes
    test -d "$HOME/yggdrasil-go" || git clone -b v0.4.0 https://github.com/yggdrasil-network/yggdrasil-go "$HOME/yggdrasil-go"
    cd "$HOME/yggdrasil-go"
    ./build
  PROVISION
end
