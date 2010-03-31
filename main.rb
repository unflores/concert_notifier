require 'yaml'

get '/' do
  @bands = Band.all
  haml :index
end

get '/account/new' do
  haml :signup
end

post '/account/create' do
  redirect '/'
end

get '/band_follow/new' do
  haml :band_follow_new
end

post '/band_follow/create' do
  band = Band.new
  band.attributes = {:name => params['name'],:url=>params['url']}
  band.save
  redirect '/'
end


helpers do
  
end