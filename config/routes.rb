Rails.application.routes.draw do
 
  get '/login', to: 'user_sessions#new', as: :login
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy', as: :logout
  resources :users, only: [:new, :create, :edit, :update, :destroy]
  resources :photos, only: [:new, :index, :create, :edit, :update, :destroy]
end
