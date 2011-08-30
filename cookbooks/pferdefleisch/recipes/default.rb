# execute "apt-get update" do
#   user 'root'
# end
# this is because my dns was messed up in my vagrant box
# i set the dns to 8.8.8.8, google's dns
# comment out if you don't need
cookbook_file "/etc/resolv.conf" do
  source 'resolve.conf'
  owner  'root'
  group  'root'
end

%w[wget curl git-core build-essential vim-nox nginx imagemagick].each do |pkg|
  package pkg do
    action :install
  end
end

include_recipe "rvm::system"

execute 'update rubygems' do
  user 'root'
  command 'gem update --system'
  action :run
end

cookbook_file "/home/vagrant/.vimrc" do
  source 'vimrc'
  owner  node[:user]
  group  node[:user]
end

remote_directory '/home/vagrant/.vim' do
  source 'vim'
  files_owner node[:user]
  files_group node[:user]
  files_mode '0755'
  owner node[:user]
  group node[:user]
  mode '0755'
end