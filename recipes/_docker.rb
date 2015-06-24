#
# Cookbook Name:: chef_server
# Recipe:: _docker
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

chef_gem 'chef-provisioning-docker'

require 'chef/provisioning/docker_driver'

with_driver 'docker'

with_machine_options(
  docker_options: {
    base_image: {
      name: 'ubuntu',
      repository: 'ubuntu',
      tag: '12.04'
    },
    ports: ['8443:443']
  }
)
