Rails.application.routes.draw do
  concern :discard do
    member do
      get 'discard'
      patch 'discard'
      patch 'restore'
      get 'delete', constraints: { format: 'js' }
    end
  end
  concern :autocomplete do
    collection do
      get 'autocomplete'
    end
  end
  concern :clone do
    member do
      get 'clone'
    end
  end
  resources :shooting_velocities do
    concerns [:autocomplete, :discard]
  end
  resources :guns do
    concerns [:discard]
  end
  resources :shooting_groups do
    collection do
      get 'next_number', constraints: { format: 'json' }
    end
    concerns [:autocomplete, :discard, :clone]
  end
  resources :shooting_logs do
    concerns [:autocomplete, :discard]
  end
  resources :shooting_locations do
    concerns [:discard]
  end
  resources :loads do
    member do
      get 'calculate_velocity'
    end
    concerns [:autocomplete, :discard, :clone]
  end
  resources :brasses do
    concerns [:discard]
  end
  resources :calibers do
    concerns [:discard]
  end
  resources :primers do
    concerns [:discard]
  end
  resources :powders do
    concerns [:discard]
  end
  resources :bullets do
    concerns [:discard]
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  get '/ballistic_calculator', to: 'ballistic_calculator#new', as: :ballistic_calculator
  post '/ballistic_calculator', to: 'ballistic_calculator#create', as: nil
  get 'users/settings', to: 'user_settings#show', as: :user_settings
  get 'users/settings/edit', to: 'user_settings#edit', as: :user_settings_edit
  put 'users/settings', to: 'user_settings#update', as: nil
  get "/*id" => 'pages#show', as: :page, format: false
  root to: "pages#show", id: 'home'
end
