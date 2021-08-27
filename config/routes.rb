Rails.application.routes.draw do
  root'sessions#home'
  get 'attractions/index'
  get 'attractions/new'
  get 'attractions/create'
  get 'attractions/show'
  get 'attractions/edit'
  get 'attractions/update'
  get 'attractions/destroy'
  get '/signin', to: 'sessions#new'
  post '/session', to: 'sessions#create'
  get 'sessions/destroy'
  
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
