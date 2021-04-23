Rails.application.routes.draw do
  resources :tasks
  resources :missions
  resources :users
  resources :testers
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  root to: "missions#index"
end
