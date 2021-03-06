Rails.application.routes.draw do
  resources :episodes
  get 'sessions/new'
  resources :locations
  resources :regions
  resources :houses
  get 'users/update_episode', to: 'users#edit_episode'
  patch 'users/update_episode', to: 'users#update_episode'
  resources :users
  resources :characters
  resources :user_characters
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'user_characters/new/:id', to: 'user_characters#new'
  root 'sessions#main'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
