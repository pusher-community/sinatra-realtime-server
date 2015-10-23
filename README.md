# Sinatra Realtime Server

An example server that responds to `POST /messages` requests and triggers Pusher events. Built to accompany the [EmberJS Realtime Chat](https://github.com/pusher-community/emberjs-realtime-chat) frontend.

# Running the server

First, install all dependencies:

```
bundle install
```

Then run the app:

```
bundle exec ruby app.rb
```

And you can then `POST` to `http://localhost:4567/messages`.
