Vagrant.configure("2") do |config|
  
	config.vm.box = "development"

	config.vm.network "forwarded_port", guest: 80, host: 8080
	config.vm.network "forwarded_port", guest: 3306, host: 3307


	config.vm.provision :shell, :path => "install.sh"

	config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=755","fmode=755"]

end
