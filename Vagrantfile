Vagrant::Config.run do |config|

  config.vm.box = "base"

  # Assign this VM to a host only network IP, allowing you to access it
  # via the IP.
  # config.vm.network "33.33.33.10"
  
  config.vm.forward_port 80, 8080
  config.vm.forward_port 22, 2222

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "pferdefleisch"
    chef.json = { :user => "aaron" }
  end

end
