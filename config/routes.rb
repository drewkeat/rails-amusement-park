Rails.application.routes.draw do
  post '/rides', to: "rides#create"
  root'sessions#home'

  get '/signin', to: 'sessions#new'
  post '/session', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout
  
  resources :users
  resources :attractions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
