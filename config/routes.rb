Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :update] 
  
  resources :channels

  post 'guides/:id', to: 'guides_channels#create'
  resources :guides do
    resources :guides_channels, only: [:destroy]
  end
end
