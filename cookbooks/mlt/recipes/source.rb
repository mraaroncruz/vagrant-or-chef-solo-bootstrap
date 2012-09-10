include_recipe 'mlt::default'

version = node['mlt']['version']

remote_file "/tmp/mlt-#{version}.tar.gz" do
  not_if "melt -version | grep -q #{version}"
  source "#{node['mlt']['url']}/v#{version}"
  mode "0644"
end

bash "build mlt" do
  not_if "melt -version | grep -q #{version}"
  cwd "/tmp"
  code <<-COMMAND.gsub(/^\s*/,'')
    mkdir mlt
    tar -zxvf mlt-#{version}.tar.gz -C mlt --strip-components 1
    (cd mlt && ./configure)
    (cd mlt && make && make install)
    (ldconfig)
  COMMAND
end

if node['mlt']['swig-ruby']
  bash "Install swig ruby bindings" do
    cwd "/tmp/mlt/src/swig/ruby"
    code <<-COMMAND.gsub(/^\s*/,'')
      ./build
      make
      sudo make install
    COMMAND
  end
end
