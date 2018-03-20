Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'signup', to: 'users#new', as: 'signup'
  resources :users, :posts, :sessions


  get 'users/show'
  get 'messages/new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'application#hello'
end
