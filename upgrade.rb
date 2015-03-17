#!/usr/bin/env ruby 

require 'optparse'
require_relative 'main'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: upgrade.rb [options]"

  opts.on("-d", "--db_version VERSION", "DB version") { |v| options[:db_version] = v }

  opts.on("-f", "--scripts_folder FOLDER", "Scripts Folder") { |v| options[:scripts_folder] = v }

end.parse!

if options.empty? || options.count == 1
  puts "arguments can't be empty!"
  puts "use ./upgrade.rb -h to get more information"
else
  LIST = Dir.entries("#{options[:scripts_folder]}")
  version = options[:db_version].to_i
  upgrade = Upgrade.new(LIST, version)
  upgrade.upgrade_db(options[:scripts_folder], version)
end

