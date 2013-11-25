

$home_dir = File.expand_path(File.dirname(__FILE__) + "/..")

require "#{$home_dir}/resources/string.rb"
require "#{$home_dir}/resources/yum_package.rb"
require "#{$home_dir}/resources/rpm_package.rb"
require "#{$home_dir}/libraries/chef_helpers.rb"

file_cache_path $home_dir
cookbook_path [ "#{$home_dir}/cookbooks" ]
log_level :debug


ARGV.each do|a|
	$is_dry_run = ["-w", "--why-run"].include? a.downcase
end
