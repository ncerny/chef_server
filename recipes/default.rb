#
# Cookbook Name:: chef_server
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'chef_server::_vagrant'

chef_server 'chef01.vagrantup.com'
