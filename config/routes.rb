Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create] 
  
  delete 'channels', to: 'channel#destroy'
  resources :channels, only: [:new, :index, :create, :edit, :update]
  
  post 'guides/:id', to: 'guides_channels#create'
  resources :guides do
    resources :guides_channels, only: [:destroy]
  end
end
