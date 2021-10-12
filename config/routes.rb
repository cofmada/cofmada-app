Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:show, :create] 

  resources :channels, only: [:new, :index, :create, :edit, :update, :destroy]
  resources :guides
  resources :guides_channels, only: [:create, :destroy]
end
