#
# Cookbook Name:: chef_server
# Recipe:: ha
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'yacs::_vagrant'

yacs_chef_server 'chef.vagrantup.com' do # API VIP URL
  topology 'ha'
end
