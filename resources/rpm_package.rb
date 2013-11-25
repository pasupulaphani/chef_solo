#
# 
# Global resource:: RpmPackage
#
# Copyright 2013,  
#

require 'open3'

class Chef::Resource::RpmPackage
	
	def dry_run(rpm_url=nil)
		# Assuming that the rpm package already exists if rpm_url is not passed 
		Chef::Helpers.file_download(rpm_url, source) if !rpm_url.nil? 

		if @action.include?(:install) || @action.include?(:upgrade)
			cmd = "rpm -Ui --test #{source}"
			Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
				error = stderr.read
				if !error.empty?
					puts "\t -Testing installation of #{source}".blue
				 	if error =~ /error/ 
				 		puts "\t -#{error}".red
				 		puts "\t - Please make sure that any reported dependencies missing are included in 'rpms' attribute;".cyan +
				 		"\n\t   If it is already added ignore dependency error message \n".cyan 
				 	else
				 		puts "\t -#{error}".yellow
				 	end
				 end
			end
		end
	end
end
