Rails.application.routes.draw do
resources :users, only: [:show] do
      get 'items', to: 'users#items'
      resources :items, only: [:show, :create]
    end
  resources :items, only: [:index]

end
