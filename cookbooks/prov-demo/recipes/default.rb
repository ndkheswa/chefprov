#
# Cookbook Name:: prov-demo
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
#context = ChefDK::ProvisioningData.context
chef_gem "chef-provisioning"
chef_gem "chef-provisioning-aws"

require 'chef/provisioning'

with_driver 'aws'

options = {
  ssh_username: 'ec2-user',
  use_private_ip_for_ssh: false,
  bootstrap_options: {
    key_name: 'yourownawskey',
    image_id: 'ami-4dbf9e7d',
    instance_type: 't2.micro',
    security_groups: 'test-servlet-container'
  },
  :convergence_options => { :ssl_verify_mode => 'verify_none'}
}
machine 'homely-demo' do
  recipe 'homely-rhel-installer'
  machine_options options
  converge true
end
