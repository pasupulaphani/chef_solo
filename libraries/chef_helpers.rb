#
# 
# Global Libraries :: chef_helpers
#
# Copyright 2013,  
#


require 'net/http'
require 'uri'

module Chef::Helpers

	def self.get_archive_name( url, ext )
		archive_name =  url.match /[^\/]*#{ext}/
		return archive_name.to_s
	end

	def self.file_download(url, download_to)
		url = URI.parse url

		Net::HTTP.start(url.host) do |http|
			resp = http.get(url.path)
				open(download_to, "wb") do |file|
				file.write(resp.body)
			end
		end
	end
end