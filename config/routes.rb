Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/register', to: 'users#new'
  post '/users', to: 'users#create'

  get '/interests', to: 'interests#index'
  post '/interests', to: 'interests#create'
  delete '/interests/:id', to: 'interests#destroy', as: :interest

end
