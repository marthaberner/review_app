Rails.application.routes.draw do
root 'welcome#index'

  resources :users
  resources :sessions, only:[:new, :create, :destroy]

  get 'registrations/new', to: 'registrations#new'
  post '/users', to: 'registrations#create'

  match '/login', to: 'sessions#new', via: 'get'
  match '/logout', to: 'sessions#destroy', via: 'delete'
end
