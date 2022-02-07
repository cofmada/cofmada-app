Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :update] 

  resources :channels
  delete 'channels/:id/edit', to: 'channels#destroy'
  post 'channels/:id', to: 'channels#update'
  
  resources :guides
  delete 'guides/:id/edit', to: 'guides#destroy'
  post 'guides/:id', to: 'guides#update'
end
