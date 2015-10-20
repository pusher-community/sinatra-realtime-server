require 'sinatra'
require 'pry'
require 'json'
require 'pusher'
require 'dotenv'
require 'sinatra/cross_origin'

Dotenv.load

Pusher.url = ENV['PUSHER_URL']

post '/messages' do
  cross_origin
  Pusher.trigger('messages', 'new_message', {
    text: @params["text"],
    username: @params["username"],
    time: @params["time"]
  })
end
