package 'nagios3' do
  action :install
end

service "nagios3" do
  supports :start => true, :restart => true
  action :start
  restart_command "/etc/init.d/nagios3 reload"
end

cookbook_file "/etc/nagios3/htpasswd.users" do
  source "htpasswd.users"
  owner  "www-data"
  group  "nagios"
  mode   "0640"
end

case node['nagios']['web_server']
when 'apache'
  include_recipe "nagios::apache"
else
  include_recipe "nagios::nginx"
end
