Rails.application.routes.draw do

  devise_for :users
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'users/show'
  get 'messages/new'


  resources :users, only: [:index, :show, :edit, :update]
  resources :posts, :sessions


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
