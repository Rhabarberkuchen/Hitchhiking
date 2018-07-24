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
  end

  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions'}

  get 'users/:id/friendships', to: 'friendships#show_friendships_of_user', as: 'friendship'


  resources :users, only: [:index, :show, :edit, :update],:has_many => :friends
  resources :posts
  resources :friendships


end
