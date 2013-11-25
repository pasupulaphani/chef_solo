#
# Cookbook Name:: timezone
# Recipe:: default
#
# Copyright 2013,  
#

require 'rubygems'
require 'net/scp'

link "/etc/localtime" do
  filename = "/usr/share/zoneinfo/#{node[:timezone][:zone]}"
  to filename
  only_if { File.exists? filename }
end