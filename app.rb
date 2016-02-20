require 'sinatra'
require 'sinatra/activerecord'
require './environments'
configure { set :server, :puma }

class Post < ActiveRecord::Base
end

get '/' do
  "Hello, world"
end
