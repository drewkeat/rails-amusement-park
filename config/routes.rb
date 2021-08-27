Rails.application.routes.draw do
  root to: 'sessions/home'
  get 'sessions/create'
  get 'sessions/destroy'
  
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
