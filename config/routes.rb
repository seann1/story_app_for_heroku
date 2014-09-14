Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  
  resources :stories do
    resources :comments
  end

  resources :users do
    resources :stories
  end
  match('/search', {:via => :get, :to => 'stories#search'})
  
  root :to => 'users#index'
end
