#
# Cookbook Name:: chef_server
# Recipe:: _chef_server_core
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

chef_server_ingredient 'chef-server-core' do
  reconfigure true
end
