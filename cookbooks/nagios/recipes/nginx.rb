include_recipe 'nginx'
include_recipe 'php-fpm'

%w[fcgiwrap spawn-fcgi].each do |p|
  package p do
    action :install
  end
end

cookbook_file "/etc/nagios3/nginx.conf" do
  source "nginx.conf"
  mode "0644"
  notifies :restart, "service[nginx]"
end

link "/etc/nginx/sites-enabled/nagios3" do
  to "/etc/nagios3/nginx.conf"
  notifies :restart, "service[nginx]"
end
