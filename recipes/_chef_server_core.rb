#
# Cookbook Name:: chef_server
# Recipe:: _chef_server_core
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

chef_server_ingredient 'chef-server-core' do
  reconfigure true
end

directory '/etc/opscode' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

# create the initial chef-server config file
template '/etc/opscode/chef-server.rb' do
  source 'chef-server.rb.erb'
  owner 'root'
  group 'root'
  action :create
  notifies :reconfigure, 'chef_server_ingredient[chef-server-core]', :immediately
end
