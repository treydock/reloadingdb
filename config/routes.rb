Rails.application.routes.draw do
  resources :shooting_velocities do
    get 'autocomplete', on: :collection
  end
  resources :guns
  resources :shooting_groups do
    collection do
      get 'autocomplete'
      get 'next_number', constraints: { format: 'json' }
    end
    member do
      get 'clone'
    end
  end
  get 'users/settings', to: 'user_settings#show', as: :user_settings
  get 'users/settings/edit', to: 'user_settings#edit', as: :user_settings_edit
  put 'users/settings', to: 'user_settings#update', as: nil
  resources :shooting_logs do
    get 'autocomplete', on: :collection
  end
  resources :shooting_locations
  resources :loads do
    collection do
      get 'autocomplete'
    end
    member do
      get 'calculate_velocity'
      get 'clone'
    end
  end
  resources :brasses
  resources :calibers
  resources :primers
  resources :powders
  resources :bullets
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'}
  get "/*id" => 'pages#show', as: :page, format: false
  root to: "pages#show", id: 'home'
end
