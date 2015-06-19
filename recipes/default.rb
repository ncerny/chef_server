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

machine_file '/var/opt/opscode/nginx/ca/be01.vagrantup.com.crt' do
  machine 'be01.vagrantup.com'
  local_path "#{Chef::Config[:trusted_certs_dir]}/be01.vagrantup.com.crt"
  action :download
end

chef_server 'fe01.vagrantup.com' do
  roles 'frontend'
  addons %w(opscode-reporting opscode-push-jobs-server opscode-manage)
end

machine_file '/var/opt/opscode/nginx/ca/be01.vagrantup.com.crt' do
  machine 'fe01.vagrantup.com'
  local_path "#{Chef::Config[:trusted_certs_dir]}/be01.vagrantup.com.crt"
  action :upload
end
