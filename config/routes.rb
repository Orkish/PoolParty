Poolparty::Application.routes.draw do
  devise_for :users
  root to: "home#splash", as: "home"

  # before_filter :authenticate_user!
  get '/index', to: "home#index"
  get '/profile', to: "profiles#index"
  get '/profile/trips', to: "profiles#trips"
  get '/trip/:id', to: "profiles#show"
  get '/new', to: "profiles#new"
  get '/profile/index', to: "profiles#index"
  post '/profile/delete', to: "profiles#delete_trip"

  get '/request/driver/:id', to: "profiles#send_sms"

  ## Post Requests
  post '/create', to: "profiles#create", as: "trips"
  # put '/users', to: "profiles#user_edit", as: "user"

end
