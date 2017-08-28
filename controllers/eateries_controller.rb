require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/burger'
require_relative '../models/eatery'
require_relative '../models/deal'

get '/eateries' do
 @eateries = Eatery.all
 erb(:"eateries/index")
end

get '/eateries/new' do
  erb(:"eateries/new")
end

post '/eateries' do
  eatery = Eatery.new(params)
  eatery.save
  redirect to '/eateries'
end

get '/' do
  erb(:index)
end
