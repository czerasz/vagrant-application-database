# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  # config.vm.box = "base"

  config.vm.define :base do |base|
    base.vm.box = "lucid32"
    base.vm.box_url = "http://files.vagrantup.com/lucid32.box"

    base.vm.network :hostonly, "33.33.33.10"
    
    base.vm.customize ["modifyvm", :id, "--memory", 512] 

    base.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file  = "base.pp"
      puppet.module_path = "puppet/modules"

      puppet.options = "--verbose --debug"
    end
  end

  config.vm.define :database do |database|
    database.vm.box = "lucid32"
    database.vm.box_url = "http://files.vagrantup.com/lucid32.box"

    database.vm.network :hostonly, "33.33.33.11"

    database.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file  = "database.pp"
      puppet.module_path = "puppet/modules"

      puppet.options = "--verbose --debug"
    end
  end

  config.vm.define :application do |application|
    application.vm.box = "lucid32"
    application.vm.box_url = "http://files.vagrantup.com/lucid32.box"

    application.vm.network :hostonly, "33.33.33.12"

    application.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file  = "application.pp"
      puppet.module_path = "puppet/modules"

      puppet.options = "--verbose --debug"
    end
  end

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  # config.vm.network :hostonly, "192.168.33.10"

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.
  # config.vm.network :bridged

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.forward_port 80, 8080

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"
end
