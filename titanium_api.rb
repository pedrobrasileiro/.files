require 'json'
require 'benchmark'

sdk_version = "3.0.2.GA"
path_file = File.join(ENV["HOME"], 'SkyDrive', "Titanium_SDK", "osx", sdk_version, "api.jsca")

api = nil

puts "Time Parse JSON"
Benchmark.bm do |x|
    x.report { 
        api = JSON.parse(File.read(path_file))
    }
end

puts "Time read/puts types"
Benchmark.bm do |x|
    x.report { 
        (api["types"].sort{|a,b| a["name"] <=> b["name"]}).each do |type|
            puts type["name"]
            #Properties
            unless (type["properties"].nil?)
                puts "   Properties"
                
                type["properties"].each do |proper|
                    puts "      #{proper['name']}:#{proper['type']}"
                end 
            end
            
            # Functions
            unless (type["functions"].nil?)
                puts "   Functions"
                type["functions"].each do |function| 
                    function_name = "      #{function["name"]}"
                    params = ""
                    
                    unless (function["parameters"].nil?)
                        params += "("
                        params += (function["parameters"].map {|param| "#{param['name']}:#{param['type']}" }).join ", "
                        params += ")"
                    end
                    
                    puts "#{function_name}#{params}"
                end
            end
        end
    }
end

api = nil