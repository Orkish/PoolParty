Poolparty::Application.routes.draw do
  devise_for :users
  root to: "home#splash"

  # before_filter :authenticate_user!
  get '/index', to: "home#index"
  get '/profile', to: "profiles#index"
  get '/profile/trips', to: "profiles#trips"
  get '/new', to: "profiles#new"
  post '/create', to: "profiles#create", as: "trips"
end
