
require 'rubygems'
require 'date'

module GenericHandler

  class ReportHandler < Chef::Handler
    def report

      message = "Problem : Chef run failed on #{node.name} \nDate : #{DateTime.now.to_s} \nMore Info : #{run_status.formatted_exception}\n\n Backtrace: \n"
      message << Array(backtrace).join("\n")

      File.open(node["chef_handler"]["report"], 'w') do |f|  
        f.puts message  
      end 
    end
  end
end