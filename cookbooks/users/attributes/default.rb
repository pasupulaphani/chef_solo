#
# Cookbook Name:: users
# Attributes :: default
#
# Copyright 2013,  
#


# user specific properties

default[:users][:add] = {
	"testuser" => {
		"password_hash" => "",
		"groups" => ["apache", "tomcat"],
		"ssh_keys" => ["ssh-rsa"]
	}
}

# Why uid ?
# ===> We set this userid to ensure there will be no decrepencies in premissions stuff
# while acceesing/creating folders users home directory/shared servers

# How to get "password_hash"
# Get the hash manually if required through the command
# "openssl passwd -1 'theplaintextpassword' 
# (or) 
# use the utility/helper "UsersHelper.get_passwd_hash('theplaintextpassword')""



# if user specific properties are not specified default ones are used

default[:users][:default][:uid] = 'default'
default[:users][:default][:password_hash] = UsersHelper.get_passwd_hash("test")
default[:users][:default][:groups] = ["nginx"]
default[:users][:default][:ssh_keys] = []