Rails.application.routes.draw do

  root 'welcome#home'
  get 'password_resets/new'

  get 'password_resets/edit'
  
  get   '/uploads/mysubmission', to: 'uploads#mysubmission'
  get   '/uploads/sharedtome', to: 'uploads#sharedToMe'
  get   '/uploads/test', to: 'uploads#test'
  get   '/images', to: 'uploads#index'
  post  '/images', to: 'uploads#create'


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
