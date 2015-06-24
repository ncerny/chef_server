#
# Cookbook Name:: chef_server
# Recipe:: _vagrant
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

chef_gem 'chef-provisioning-vagrant'

require 'chef/provisioning/vagrant_driver'

with_driver 'vagrant'

with_machine_options(
  vagrant_options: {
    'vm.box' => 'opscode-centos-6.6'
  }
)
