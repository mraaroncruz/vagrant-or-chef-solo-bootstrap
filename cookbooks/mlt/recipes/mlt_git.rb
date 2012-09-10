git "mlt" do
  repository "git://github.com/mltframework/mlt.git"
  reference 'master'
  destination node[:mlt][:source_directory]
  action :checkout
end

bash "Install mlt" do
  code <<-COMMAND.gsub(/^\s*/,'')
    cd #{node[:mlt][:source_directory]}
    ./configure
    make
    make install
    ldconfig
  COMMAND
end
