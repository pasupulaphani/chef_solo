#
# 
# Global resource:: YumPackage
#
# Copyright 2013,  
#


class Chef::Resource::YumPackage
	def dry_run(arg=nil)
		if (defined?(@arch)).nil?
			@arch = node['kernel']['machine'] =~ /x86_64/ ? "x86_64" : "i586"
		else
			verify_architecture
		end

		return if !((defined?(@version)).nil?) && (@version.nil? || @version.empty?) 

		if verify_version
			puts "Requested package is available"
		else
			puts "Requested package is not available in the package manager soruces"
		end
	end

	def get_available_versions
		%x(yum list available #{@package_name} | awk '$1 ~ "#{@package_name}" {print $1,$2}')
	end

	def verify_version
		puts "Checking for available versions of package #{@package_name}"
		puts "package.arch \t version"
		get_available_versions.split().each_slice(2) do |b|
			puts b[0]+" \t "+b[1]
		    if (b[0].match /#{@package_name}\.(#{@arch}|noarch)/) && b[1] == @version
		    	return true
		    end
		end
		return false
	end

	def verify_architecture
		if !((defined?(@arch)).nil?) && @arch != "noarch" &&
		   !(node['kernel']['machine'].match /#{@arch}/)
			puts "Requested package architecture #{@arch} is different from kernal architecture #{node['kernel']['machine']}"
			puts "Please make sure that architecture compatible libraries are installed"
		end

	end
end
