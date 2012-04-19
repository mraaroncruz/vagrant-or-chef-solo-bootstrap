Vagrant::Config.run do |config|

  config.vm.box = "base"

  # Assign this VM to a host only network IP, allowing you to access it
  # via the IP.
  # config.vm.network "33.33.33.10"
  config.vm.forward_port 80, 8080
  config.vm.forward_port 22, 2222

  # if you want to set up multiple instances at the same time,
  # you can name them (:web and :gridfs below) and refer to them 
  # in your vagrant commands
  #
  # vagrant provision web
  # vagrant provision gridfs
  # vagrant reload gridfs
  # ...
  # as per the vagrant documentation, you should
  # choose IPs that will not clash with your local
  # network
  # 192.168.2.100 # bad
  # 22.22.22.22 # unbad
  #
  #config.vm.define :web do |web_config|
    #web_config.vm.box = box
    #web_config.vm.forward_port(80, 8080)
    #web_config.vm.network :hostonly, "22.22.22.22"
  #end
#
  #config.vm.define :gridfs do |db_config|
    #db_config.vm.box = box
    #db_config.vm.forward_port(27017, 27000)
    #db_config.vm.network :hostonly, "22.22.22.23"
  #end

  config.vm.forward_port(80, 8080)
  config.vm.network :hostonly, "22.22.22.22"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "pferdefleisch"
    chef.json = { :user => "vagrant" }
  end

end
