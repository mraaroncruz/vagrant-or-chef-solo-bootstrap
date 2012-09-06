include_recipe 'apache2'

package 'nagios3' do
  action :install
end

service "nagios3" do
  supports :start => true, :restart => true
  action :start
  restart_command "/etc/init.d/nagios3 reload"
end

cookbook_file "/etc/nagios3/apache2.conf" do
  source "apache.conf"
  mode "0644"
  notifies :restart, "service[apache2]"
end

link "/etc/nagios3/apache.conf" do
  to "/etc/apache2/sites-enabled/nagios3"
  notifies :restart, "service[apache2]"
end

cookbook_file "/etc/nagios3/htpasswd.users" do
  source "htpasswd.users"
  owner  "www-data"
  group  "nagios"
  mode   "0640"
end
