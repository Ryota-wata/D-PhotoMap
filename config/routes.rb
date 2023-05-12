Rails.application.routes.draw do
  root 'static_pages#top'
  get '/privacy', to: 'static_pages#privacy'
  get '/terms', to: 'static_pages#terms'
  get '/login', to: 'user_sessions#new', as: :login
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy', as: :logout
  resources :users, only: [:new, :create, :edit, :update, :destroy]
  resource :profile, only: %i[show edit update]
  resources :photos, only: [:new, :index, :create, :edit, :update, :destroy, :show]
  resources :diaries, only: [:new, :index, :create, :edit, :update, :destroy, :show]
  resources :lottelies, only: [:new, :index, :create, :edit, :update, :destroy]
  resources :tags do
    get 'diaries', to: 'diaries#search'
  end
end