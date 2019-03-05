Rails.application.routes.draw do
  resources :bullets
  devise_for :users
  get 'home/index'
  root to: "home#index"
end
