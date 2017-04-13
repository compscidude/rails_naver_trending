
Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'topics#index'
  resources :topics, only: [:show]
  resources :users, only: [:create, :new, :show]
  resources :sessions, only: [:create]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # post request to comments goes to create !
  post 'comments', to: 'comments#create', as: 'comments'

  get '*path', to: redirect('/')

end


