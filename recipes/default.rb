#
# Cookbook Name:: chef_server
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'yacs::_vagrant'

# chef_server 'chef01.vagrantup.com'

yacs_chef_server 'be01.vagrantup.com' do
  roles 'backend'
  addons %w(opscode-reporting opscode-push-jobs-server)
  machine_options vagrant_options: {
    'vm.box' => 'opscode-centos-6.6',
    'vm.network' => ":private_network, :ip => '33.33.33.10'"
  }
end

directory Chef::Config[:file_cache_path]

machine_file '/etc/hosts' do
  machine 'be01.vagrantup.com'
  local_path "#{Chef::Config[:file_cache_path]}/private-chef-running.json"
  action :download
end

yacs_chef_server 'fe01.vagrantup.com' do
  roles 'frontend'
  addons %w(opscode-reporting opscode-push-jobs-server opscode-manage)
  machine_options vagrant_options: {
    'vm.box' => 'opscode-centos-6.6',
    'vm.network' => ":private_network, :ip => '33.33.33.20'"
  }
end

machine_file '/etc/hosts' do
  machine 'fe01.vagrantup.com'
  local_path "#{Chef::Config[:file_cache_path]}/private-chef-running.json"
  action :upload
end
