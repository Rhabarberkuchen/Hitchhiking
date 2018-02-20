Rails.application.routes.draw do
  get 'sessions/new'

  resources :users, :posts
  get 'basic_pages/profile'

  get 'basic_pages/home'

  get 'basic_pages/help'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'application#hello'
end
