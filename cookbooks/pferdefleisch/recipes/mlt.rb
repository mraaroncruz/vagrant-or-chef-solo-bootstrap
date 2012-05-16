%w[ffmpeg automake autoconf libtool intltool g++ yasm swig libmp3lame-dev libgavl-dev libsamplerate-dev libxml2-dev ladspa-sdk libjack-dev libsox-dev libsdl-dev libgtk2.0-dev liboil-dev libsoup2.4-dev libqt4-dev libexif-dev libtheora-dev libvdpau-dev libvorbis-dev python-dev libavformat-dev frei0r-plugins-dev libavdevice-dev libswscale-dev libdv-dev].each do |pkg|
  package pkg do
    action :install
  end
end

git "mlt" do
  repository "git://github.com/mltframework/mlt.git"
  reference 'master'
  destination "/home/#{node[:user]}/mlt"
  action :checkout
  user node[:user]
end

execute "Install mlt" do
  command "cd /home/#{node[:user]}/mlt && ./configure && make && make install && ldconfig"
  action :run
  user 'root'
  #user node[:user]
end

git "melted" do
  repository "git://github.com/mltframework/melted.git"
  reference 'master'
  destination "/home/#{node[:user]}/melted"
  action :checkout
  user node[:user]
end

execute "Install melted" do
  command [
    "cd /home/#{node[:user]}/melted",
    "./configure --prefix=/usr/local",
    "cd src",
    "cd melted++ && ./configure --prefix=/usr/local && make && make install && cd ..",
    "cd mvcp &&  make install && cd ..",
    "cd mvcp-client && make install && cd ..",
    "cd mvcp-console && make install && cd ..",
    "cd /home/#{node[:user]}/melted && make && make install && ldconfig"
  ].join(" && ")
  action :run
  user 'root'
  #user node[:user]
end

