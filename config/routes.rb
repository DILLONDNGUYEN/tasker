Rails.application.routes.draw do
  resources :tasks
  resources :missions
  resources :users
  resources :testers
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "mission#index"
end
