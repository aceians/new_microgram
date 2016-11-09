Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'


  
  get 'static_pages/home'

  get 'static_pages/help'

  root 'static_pages#home'
  

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  resources :uploads
  
  
end
