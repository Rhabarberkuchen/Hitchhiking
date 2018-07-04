Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root 'users/sessions#new'
    get  'users/:id/edit', to: 'users/registrations#edit'
    get '/sign_up', to: 'users/registrations#new'
    get '/sign_in', to: 'users/sessions#new'
    get '/users/:id', to: 'users#show'
  end

  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions'}

  get 'messages/new'


  resources :users, only: [:index, :show, :edit, :update]
  resources :posts


end
