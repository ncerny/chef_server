#
# Cookbook Name:: chef_server
# Recipe:: destroy
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'yacs::_vagrant'

# yacs_chef_server 'chef01.vagrantup.com' do
#   action :destroy
# end

yacs_chef_server 'be01.vagrantup.com' do
  action :destroy
end

yacs_chef_server 'fe01.vagrantup.com' do
  action :destroy
end
