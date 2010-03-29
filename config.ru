require 'rubygems'
require 'sinatra'
require 'Haml'
require 'yaml'

pants = ''
configure :development do
  pants = 'yes'
end

puts pants + 'and default'

require 'main'
 
run Sinatra::Application