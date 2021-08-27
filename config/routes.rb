Rails.application.routes.draw do
  get 'attractions/index'
  get 'attractions/new'
  get 'attractions/create'
  get 'attractions/show'
  get 'attractions/edit'
  get 'attractions/update'
  get 'attractions/destroy'
  root'sessions#home'
  get 'sessions/create'
  get 'sessions/destroy'
  
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
