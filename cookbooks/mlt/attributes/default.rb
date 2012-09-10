#
# Author:: Aaron Cruz (<aaron@aaroncruz.com>)
# Cookbook Name:: mlt
# Attribute:: default
#
# Copyright 2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

## MLT
default['mlt']['source_directory'] = '/usr/local/src/mlt'
default['mlt']['version']          = '0.8.2'
default['mlt']['url']              = 'https://github.com/mltframework/mlt/tarball'
### swig
default['mlt']['swig-ruby']        = false
default['mlt']['swig-python']      = false
default['mlt']['swig-java']        = false
default['mlt']['swig-lua']         = false

## MELTED
default['melted']['source_directory'] = '/usr/local/src/melted'
