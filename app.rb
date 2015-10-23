require 'sinatra'
require 'sinatra/cross_origin'

require 'pusher'
require 'dotenv'

Dotenv.load

Pusher.app_id = ENV["PUSHER_APP_ID"]
Pusher.key = ENV["PUSHER_APP_KEY"]
Pusher.secret = ENV["PUSHER_APP_SECRET"]

post '/messages' do
  cross_origin
  Pusher.trigger('messages', 'new_message', {
    text: @params["text"],
    username: @params["username"],
    time: @params["time"]
  })
end
