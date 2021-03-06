require 'sinatra'
require 'json'
require 'sinatra/cross_origin'
require 'rack/utils'
require 'rack/contrib'

require 'pusher'
require 'dotenv'

Dotenv.load

use Rack::PostBodyContentTypeParser

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

options "*" do
  response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"

  response.headers["Access-Control-Allow-Origin"] = "*"

  response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"

  200
end
