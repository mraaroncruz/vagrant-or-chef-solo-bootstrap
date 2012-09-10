#
# Cookbook Name:: mlt
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w[ffmpeg automake autoconf libtool intltool g++ yasm swig libmp3lame-dev libgavl-dev libsamplerate-dev libxml2-dev ladspa-sdk libjack-dev libsox-dev libsdl-dev libgtk2.0-dev liboil-dev libsoup2.4-dev libqt4-dev libexif-dev libtheora-dev libvdpau-dev libvorbis-dev python-dev libavformat-dev frei0r-plugins-dev libavdevice-dev libswscale-dev libdv-dev].each do |pkg|
  package pkg do
    action :install
  end
end
