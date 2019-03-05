Rails.application.routes.draw do
  resources :primers
  resources :powders
  resources :bullets
  devise_for :users
  get 'home/index'
  root to: "home#index"
end
