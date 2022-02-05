Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :update] 

  resources :channels
  delete 'channels/:id/edit', to: 'channels#destroy'
  
  
  post 'guides/new', to: 'guides#create'
  resources :guides
end
