#
# Cookbook Name:: chef_server
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'chef_server::_vagrant'

# chef_server 'chef01.vagrantup.com'

chef_server 'be01.vagrantup.com' do
  roles 'backend'
  addons %w(opscode-reporting opscode-push-jobs-server)
end

directory Chef::Config[:file_cache_path]

machine_file '/etc/hosts' do
  machine 'be01.vagrantup.com'
  local_path "#{Chef::Config[:file_cache_path]}/private-chef-running.json"
  action :download
end

chef_server 'fe01.vagrantup.com' do
  roles 'frontend'
  addons %w(opscode-reporting opscode-push-jobs-server opscode-manage)
end

machine_file '/etc/hosts' do
  machine 'fe01.vagrantup.com'
  local_path "#{Chef::Config[:file_cache_path]}/private-chef-running.json"
  action :upload
end
