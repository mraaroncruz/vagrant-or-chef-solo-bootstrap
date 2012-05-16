HOME = "/home/#{node[:user]}"
RUBY_VER = "1.9.3-p194"
RBENV = "#{HOME}/.rbenv/bin/rbenv"

%w[zlib1g-dev libxml2-dev libxslt-dev nodejs].each do |pkg|
  package pkg do
    action :install
  end
end

git "rbenv" do
  repository "git://github.com/sstephenson/rbenv"
  reference 'master'
  destination "#{HOME}/.rbenv"
  action :checkout
  user node[:user]
end

execute "create rbenv plugin directory and bootstrap rbenv" do
  command [
    %Q[echo 'export PATH="#{HOME}/.rbenv/bin:$PATH"' >> #{HOME}/.zshenv],
    %Q[echo 'eval "$(rbenv init -)"' >> #{HOME}/.zshenv],
    %Q[echo 'export PATH="#{HOME}/.rbenv/bin:$PATH"' >> #{HOME}/.bash_profile],
    %Q[echo 'eval "$(rbenv init -)"' >> #{HOME}/.bash_profile],
    "mkdir #{HOME}/.rbenv/plugins"
  ].join(' && ')
  action :run
  user node[:user]
end

git "ruby-build" do
  repository "git://github.com/sstephenson/ruby-build"
  reference "master"
  destination "/home/#{node[:user]}/.rbenv/plugins/ruby-build"
  action :checkout
  user node[:user]
end

execute "install ruby #{RUBY_VER}" do
  command "#{RBENV} rehash && #{RBENV} install #{RUBY_VER}"
  action :run
  user node[:user]
  environment({ "HOME" => HOME, "RBENV_ROOT" => "#{HOME}/.rbenv" })
end

execute "global ruby rbenv" do
  command "#{RBENV} rehash && #{RBENV} global #{RUBY_VER}"
  action :run
  user node[:user]
  environment({ "HOME" => HOME })
end

execute "install bundler" do
  command "gem install bundler"
  action :run
  user node[:user]
  environment({ "HOME" => HOME })
end
