Rails.application.routes.draw do
  resources :loads do
    get 'autocomplete', on: :collection
  end
  resources :brasses
  resources :calibers
  resources :primers
  resources :powders
  resources :bullets
  devise_for :users
  get 'home/index'
  root to: "home#index"
end
