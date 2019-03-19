Rails.application.routes.draw do

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# paths that are used for devise controllers
  devise_scope :user do
    root 'users/sessions#new'
    # first http method, then the uri pattern and last the controller and after "#" the controller method
    get  'users/:id/edit', to: 'users/registrations#edit'
    get '/users/:id', to: 'users#show'

    #paths for friendships and friendrequests are made
    post '/users/add_friend/', to: 'users#add_friend'
    post '/users/remove_friend/', to: 'users#remove_friend'
    post '/users/add_friend_request', to: 'users#add_friend_request'
    post '/users/accept_friend_request', to: 'users#accept_friend_request'
    post '/users/deny_friend_request', to: 'users#deny_friend_request'

    #sign in can be accessed through a different path
    get '/sign_up', to: 'users/registrations#new'
    get '/sign_in', to: 'users/sessions#new'
  end


# controller has to be specified since there are more controllers for user
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions'}

  get '/aboutus', to: 'pages#aboutus'
  get '/privacy', to: 'pages#privacy'

# nested routes, so posts have to be accessed through
# user/1/simple_post/1
  resources :users, only: [:edit, :update] do
    resources :simple_posts
  end

# resources creates all routes at once
# but here are limited routes, not all of them are needed
  resources :friendships, only: [:index]


end
