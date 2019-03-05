Rails.application.routes.draw do
  resources :calibers
  resources :primers
  resources :powders
  resources :bullets
  devise_for :users
  get 'home/index'
  root to: "home#index"
end
