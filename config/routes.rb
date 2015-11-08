Rails.application.routes.draw do

  get '/coding-challenges', to:"kata#index"

  post '/coding-challenges', to:"kata#create"

  post '/submit-answer', to:"kata#submit"

  root "users#signup"

  get "/signup", to: "users#signup"

  post "/signup", to:"users#create"

  get '/login', to:"users#login", as:"home"

  post "/login", to:"users#attempt_login"

  delete '/logout', to: "users#logout", as:"logout"

  resources :resets, only: [:new, :edit, :create, :update]
end
