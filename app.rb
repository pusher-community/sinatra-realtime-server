require 'sinatra'
require 'sinatra/cross_origin'
require 'rack/utils'

require 'pusher'
require 'dotenv'

Dotenv.load

Pusher.app_id = ENV["PUSHER_APP_ID"]
Pusher.key = ENV["PUSHER_APP_KEY"]
Pusher.secret = ENV["PUSHER_APP_SECRET"]

get '/ping' do
  'PONG'
end

post '/messages' do
  cross_origin
  Pusher.trigger('messages', 'new_message', {
    text: Rack::Utils.escape_html(@params["text"]),
    username: Rack::Utils.escape_html(@params["username"]),
    time: Rack::Utils.escape_html(@params["time"])
  })
end
