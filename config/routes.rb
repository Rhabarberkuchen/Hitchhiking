Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root 'users/sessions#new'
    get  'users/:id/edit', to: 'users/registrations#edit'
    get '/sign_up', to: 'users/registrations#new'
    get '/sign_in', to: 'users/sessions#new'
    get '/users/:id', to: 'users#show'
    post '/users/add_friend/', to: 'users#add_friend'
    post '/users/remove_friend/', to: 'users#remove_friend'
    post '/users/add_friend_request', to: 'users#add_friend_request'
    post '/users/accept_friend_request', to: 'users#accept_friend_request'
    post '/users/deny_friend_request', to: 'users#deny_friend_request'
  end


  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions'}

  get 'users/:id/friendships', to: 'friendships#show_friendships_of_user', as: 'friendship'


  resources :users, only: [:index, :edit, :update] do
    resources :simple_posts
  end

  resources :hh_attributes, only: [:show, :edit, :update, :create]
  resources :friendships
  resources :friend_requests


end
