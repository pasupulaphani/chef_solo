#
# Cookbook Name:: ssh
# Attribute:: default
#
# Copyright 2013,  .
#

default[:ssh][:install_dir] = "/etc/ssh"
default[:ssh][:authorized_keys_dir] = File.join(node[:ssh][:install_dir], "authorized_keys")

default[:ssh][:user]  = "root"
default[:ssh][:group] = "root"
