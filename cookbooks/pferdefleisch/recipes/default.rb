execute "apt-get update" do
  user 'root'
end

%w[wget curl git-core build-essential vim-nox nginx zsh-beta zsh-dev redis-server].each do |pkg|
  package pkg do
    action :install
  end
end
