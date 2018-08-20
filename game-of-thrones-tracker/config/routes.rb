Rails.application.routes.draw do
  resources :locations
  resources :regions
  resources :houses
  resources :users
  resources :characters
  resources :user_characters

  get 'user_characters/new/:id', to: 'user_characters#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
