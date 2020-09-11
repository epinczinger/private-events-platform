Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'
 
  resources :users, only: [:new, :create, :show, :index]
  resources :events

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'logout', to: 'sessions#destroy'

  

  
end
