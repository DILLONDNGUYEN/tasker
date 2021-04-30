Rails.application.routes.draw do
  resources :tasks
  resources :missions do
  resources :tasks
  end
  resources :users do 
  resources :missions, shallow: true
  end
  # devise_for :users
#ominauth-google omniauth

  get 'auth/:provider/callback', to: "sessions#googleomniauth"
  get 'auth/failure', to: redirect("/login")

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  root to: "missions#index"
end
