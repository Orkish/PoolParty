Poolparty::Application.routes.draw do
  devise_for :users
  root to: "home#splash"

  # before_filter :authenticate_user!
  get '/index', to: "home#index"

end
