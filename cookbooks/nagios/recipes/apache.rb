include_recipe 'apache2'

cookbook_file "/etc/nagios3/apache2.conf" do
  source "apache.conf"
  mode "0644"
  notifies :restart, "service[apache2]"
end

link "/etc/nagios3/apache.conf" do
  to "/etc/apache2/sites-enabled/nagios3"
  notifies :restart, "service[apache2]"
end
