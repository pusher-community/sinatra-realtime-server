# Sinatra Realtime Server

An example server that responds to `POST /messages` requests and triggers Pusher events. Built to accompany the [EmberJS Realtime Chat](https://github.com/pusher-community/emberjs-realtime-chat) frontend.

# Running the server

First, install all dependencies:

```bash
bundle install
```

Then create a `.env` file with your pusher credentials (see `.env.example` for keys).

Then run the app:

```bash
bundle exec ruby app.rb
```

And you can then `POST` to `http://localhost:4567/messages`.

```bash
curl http://localhost:4567/messages --data 'time=0&username=foo&text=bar'
```
