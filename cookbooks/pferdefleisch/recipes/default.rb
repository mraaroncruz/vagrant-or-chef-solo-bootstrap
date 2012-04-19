execute "apt-get update" do
  user 'root'
end

# what is below exists because my dns was messed up in my vagrant box
# i set the dns to 8.8.8.8, google's dns
# comment out if you don't need
#
# Edit: This has been unnecessary for me lately but
# I will leave it in until the next release
#
#cookbook_file "/etc/resolv.conf" do
  #source 'resolve.conf'
  #owner  'root'
  #group  'root'
#end

%w[wget curl git-core build-essential vim-nox nginx zsh-beta zsh-dev ffmpeg melt].each do |pkg|
  package pkg do
    action :install
  end
end

git "my dotfiles" do
  repository "git://github.com/pferdefleisch/dotfiles.git"
  reference 'master'
  destination "/home/#{node[:user]}/.dotfiles"
  action :checkout
  user node[:user]
end

git "oh-my-zsh" do
  repository "git://github.com/pferdefleisch/oh-my-zsh.git"
  reference 'me'
  destination "/home/#{node[:user]}/.oh-my-zsh"
  action :checkout
  user node[:user]
end

execute "change shell to zsh" do
  command "usermod -s /bin/zsh #{node[:user]}"
  action :run
  user "root"
end

dotfile_commands = %w[.vimrc .vim/ .gemrc .gitconfig .zshrc].map { |file| "rm -rf /home/#{node[:user]}/#{file} && ln -s /home/#{node[:user]}/.dotfiles/#{file} /home/#{node[:user]}/#{file.gsub(/\/$/, '')}" }.join(' && ')
execute "symlink dotfiles" do
  command "#{dotfile_commands} && cd /home/#{node[:user]}/.dotfiles && git submodule init && git submodule update"
  action :run
  user node[:user]
end

