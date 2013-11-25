#
# Cookbook Name:: ssh
# Recipe:: default
#
# Copyright 2013,  
#

# Install ssh
# action : donothing ;By default ssh is installed 

include_recipe "ssh::sshd"

