# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure '2' do |config|
  config.vm.box = 'ubuntu/focal64'

  config.vm.provision :file, source: 'files/yggdrasil',      destination: 'yggdrasil'
  config.vm.provision :file, source: 'files/yggdrasilctl',   destination: 'yggdrasilctl'
  config.vm.provision :file, source: 'files/http_server.rb', destination: 'http_server.rb'

  config.vm.provision :shell, privileged: false, inline: <<~PROVISION
    sudo apt-get update
    sudo apt-get upgrade --yes
    sudo apt-get install git golang ruby --yes
    test -d "$HOME/yggdrasil-go" || git clone -b v0.4.0 https://github.com/yggdrasil-network/yggdrasil-go "$HOME/yggdrasil-go"
    cd "$HOME/yggdrasil-go"
    ./build
  PROVISION

  ####################
  # Virtual machines #
  ####################

  config.vm.define :public1 do |config|
    # Yggdrasil IPv6 address is 200:253d:cbe3:4946:a1db:e5e7:1683:e8da
    # Yggdrasil IPv6 subnet is 300:253d:cbe3:4946::/64

    config.vm.provision :file,
                        source: 'files/yggdrasil.conf/public1',
                        destination: 'yggdrasil.conf'
  end

  config.vm.define :public2 do |config|
    # Yggdrasil IPv6 address is 201:fe7d:4918:f991:b081:9097:7464:7d79
    # Yggdrasil IPv6 subnet is 301:fe7d:4918:f991::/64

    config.vm.provision :file,
                        source: 'files/yggdrasil.conf/public2',
                        destination: 'yggdrasil.conf'
  end
end
