require 'yaml'

get '/' do
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
  redirect '/'
end


helpers do
  
end