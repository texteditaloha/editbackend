require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require 'json'

configure { set :server, :puma }

class Post < ActiveRecord::Base
end

get '/' do
  "Cate store"
end

get '/:key' do
  "Cate store #{params[:key]}"
end

post '/set' do
  content_type :json
  if(params[:token] == ENV['TOKEN'])
    status 402
  else
    Post.create!(key: params[:key], value: params[:value])
    params[:key]
  end
end
