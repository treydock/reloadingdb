Rails.application.routes.draw do
  resources :shooting_groups
  get 'users/settings', to: 'user_settings#show', as: :user_settings
  get 'users/settings/edit', to: 'user_settings#edit', as: :user_settings_edit
  put 'users/settings', to: 'user_settings#update', as: nil
  resources :shooting_logs
  resources :shooting_locations
  resources :loads do
    get 'autocomplete', on: :collection
  end
  resources :brasses
  resources :calibers
  resources :primers
  resources :powders
  resources :bullets
  devise_for :users
  get "/*id" => 'pages#show', as: :page, format: false
  root to: "pages#show", id: 'home'
end
