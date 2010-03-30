require 'rubygems'
require 'sinatra'
require 'Haml'
require 'yaml'
require 'dm-core'


db = {}
configure :development do
   DataMapper::Logger.new($stdout, :debug)
   YAML.load_file('./data/development_database_config.yml').each { |key, value| db[key.to_sym] = value||'' }
   DataMapper.setup(:default, "#{db[:adapter]}://#{db[:username]}@localhost/#{db[:database]}")
   DataMapper.auto_migrate!
end

configure :production do
  # YAML.load_file().each { |key, value| @options[key.to_sym] = value }
end

require 'data/models'


require 'main'
 
run Sinatra::Application