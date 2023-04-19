Rails.application.routes.draw do
  root 'static_pages#top'
  get '/map', to: 'static_pages#map'
  get '/login', to: 'user_sessions#new', as: :login
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy', as: :logout
  resources :users, only: [:new, :create, :edit, :update, :destroy]
  resources :photos, only: [:new, :index, :create, :edit, :update, :destroy]
  resources :diaries, only: [:new, :index, :create, :edit, :update, :destroy]
end