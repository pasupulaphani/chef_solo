#!/bin/bash

# Optional (make sure that dependecies are installed)
# sudo yum update
# sudo yum install -y curl
# sudo yum install -y git
# sudo yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel
# sudo yum install -y libyaml-devel libffi-devel openssl-devel make bzip2
# sudo yum install -y autoconf automake libtool bison
# sudo yum install -y libxml2-devel libxslt-devel

# Please make sure that you are running chef-solo version >= 11.6
curl -L https://www.opscode.com/chef/install.sh | bash


# install dependencies 
# No explecit installation of ruby, gem required unless required by ur app.
# Chef embeds ruby, gem ... binaries in "/opt/chef/embedded/bin" to create its own env
# Chef uses embeded binaries when running recipies.

#####################################################################
#####  Tried to use berkshelf for cookbook dependency resolution,
#####  but didn't work as the depndencies are dowloaded with version numbers

# # Install berkshelf gem
# # We use berkshelf to download cookbooks (similar to "exec bundle")
# sudo /opt/chef/embedded/bin/gem install berkshelf --no-ri --no-rdoc

# # This will download all the dependent cookbooks and resolve dependencies
# BERKSHELF_PATH=`pwd`
# sudo /opt/chef/embedded/bin/berks install
#####################################################################
# Should host chef server to manage things smoothly

#chef-solo -c config/solo.rb -j config/node.json
