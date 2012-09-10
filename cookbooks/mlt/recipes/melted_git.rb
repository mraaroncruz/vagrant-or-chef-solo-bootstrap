git "melted" do
  repository "git://github.com/mltframework/melted.git"
  reference 'master'
  destination node[:mlt][:source_directory]
  action :checkout
end

bash "Install melted" do
  code <<-COMMAND.gsub(/^\s*/, '')
    cd #{node[:melted][:source_directory]}
    ./configure --prefix=/usr/local
    cd src
    cd melted++
    ./configure --prefix=/usr/local
    make
    make install
    cd ..
    cd mvcp
    make install
    cd ..
    cd mvcp-client
    make install
    cd ..
    cd mvcp-console
    make install
    cd ..
    cd #{node[:melted][:source_directory]}
    make
    make install
    ldconfig
  COMMAND
end

