#
# Cookbook Name:: chef_server
# Recipe:: _chef_server_core
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

chef_ingredient 'chef-server' do
  config <<-EOS
api_fqdn "#{node['api_fqdn']}"
EOS
  action :install
end

ingredient_config 'chef-server' do
  notifies :reconfigure, 'chef_ingredient[chef-server]'
end
