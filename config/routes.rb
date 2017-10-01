Rails.application.routes.draw do
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create, :index]
  root 'posts#index'


end
