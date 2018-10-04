Rails.application.routes.draw do
  root "welcome#about"
  
  get '/signup', to: "registrations#new"
  post '/signup', to: "registrations#create"

  get 'login', to: "sessions#new"
  post '/login', to: "sessions#create" 
  delete '/logout', to: "sessions#destroy"

  get 'users/:id', to: "users#show", as: "profile"

  resources :chatrooms, param: :slug
  resources :messages
  
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  # AC can now listen for websocket request on ws://localhost:3000/cable 
  # using the Rack socket hijacking API. 
  # when main app is instantiated, an instanc eof action cable will also be created. AC will, because of these instructions
  # establish a websocket connection on localhost:3000/cable
  # and begin listning for socket requests on that URI. 
# this establishes to socket connction on the server side. 
# next, do it for clien/consumer side, using assets/js/channles/chatrooms.js
end
