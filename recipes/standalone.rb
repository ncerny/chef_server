#
# Cookbook Name:: chef_server
# Recipe:: standalone
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'yacs::_vagrant'

yacs_chef_server 'chef01.vagrantup.com'
