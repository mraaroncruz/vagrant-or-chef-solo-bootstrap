include_recipe 'mlt::default'

git "mlt" do
  repository "git://github.com/mltframework/mlt.git"
  reference 'master'
  destination node[:mlt][:source_directory]
  action :checkout
end

execute "Install mlt" do
  command <<-COMMAND.gsub(/^\s*/,'')
    cd #{node[:mlt][:source_directory]}
    ./configure
    make
    make install
    ldconfig
  COMMAND
  action :run
end
