#
# Cookbook Name:: chef_server
# Recipe:: destroy
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'chef_server::_vagrant'

# chef_server 'chef01.vagrantup.com' do
#   action :destroy
# end

chef_server 'be01.vagrantup.com' do
  action :destroy
end

chef_server 'fe01.vagrantup.com' do
  action :destroy
end
