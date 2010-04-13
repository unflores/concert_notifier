require 'rubygems'
require 'sinatra'
require 'Haml'
require 'yaml'
require 'dm-core'
require "digest/sha1"

require "sinatra-authentication"
require 'data/models'
use Rack::Session::Cookie, :secret => 'Be drinkin t3h cool4id'


db = {}
debug = false
configure :development do
   DataMapper::Logger.new($stdout, :debug)
   YAML.load_file('./data/development_database_config.yml').each { |key, value| db[key.to_sym] = value||'' }
   DataMapper.setup(:default, "#{db[:adapter]}://#{db[:username]}@localhost/#{db[:database]}")
   # DataMapper.auto_migrate!
end
   
configure :production do
  # YAML.load_file().each { |key, value| @options[key.to_sym] = value }
end






get '/' do
  @bands = DmUser.get(session[:user]).bands if session[:user]
  haml :index
end


get '/band_follow/new' do
  if logged_in?
    haml :band_follow_new
  else
    redirect '/'
  end
end

post '/band_follow/create' do
  user = DmUser.get(session[:user])
  user.bands.new(:name => params['name'],:url=>params['url'])
  user.save
  redirect '/'
end


helpers do
  
end