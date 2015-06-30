#
# Cookbook Name:: chef_server
# Recipe:: _aws
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

chef_gem 'chef-provisioning-aws'

require 'chef/provisioning/aws_driver'

with_driver 'aws::us-west-1'

# aws_dhcp_options 'ref-dhcp-options' do
#   domain_name          'example.com'
#   domain_name_servers  %w(8.8.8.8 8.8.4.4)
#   ntp_servers          %w(8.8.8.8 8.8.4.4)
#   netbios_name_servers %w(8.8.8.8 8.8.4.4)
#   netbios_node_type    2
#   aws_tags :chef_type => "aws_dhcp_options"
# end

aws_vpc 'yacs-vpc' do
  cidr_block '192.168.253.0/24'
  internet_gateway true
  instance_tenancy :default
  main_routes '0.0.0.0/0' => :internet_gateway
  # dhcp_options 'ref-dhcp-options'
  enable_dns_support true
  enable_dns_hostnames true
  aws_tags chef_type: 'aws_vpc'
end

aws_subnet 'yacs-subnet' do
  vpc 'yacs-vpc'
  cidr_block '192.168.253.0/24'
  availability_zone 'us-west-1a'
  map_public_ip_on_launch false
  route_table 'yacs-main-route-table'
  aws_tags chef_type: 'aws_subnet'
end

aws_route_table 'yacs-main-route-table' do
  vpc 'yacs-vpc'
  routes '0.0.0.0/0' => :internet_gateway
  aws_tags chef_type: 'aws_route_table'
end

aws_key_pair 'nathancerny@ec-metal' do
  private_key_options(
    format: :pem,
    type: :rsa,
    regenerate_if_different: true
  )
  allow_overwrite true
end

aws_security_group 'yacs-sg1' do
  vpc 'yacs-vpc'
  inbound_rules '0.0.0.0/0' => [22, 80, 443]
  aws_tags chef_type: 'aws_security_group'
end

# aws_ebs_volume 'chef01.yacs.chef.co' do
#   machine 'chef01.yacs.chef.co'
#   availability_zone 'a'
#   size 100
#   #snapshot
#   iops 3000
#   volume_type 'io1'
#   encrypted true
#   device '/dev/sda2'
#   aws_tags :chef_type => "aws_ebs_volume"
# end
