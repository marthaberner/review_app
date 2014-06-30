Rails.application.routes.draw do
root 'welcome#index'

  resources :users

  get 'registrations/new', to: 'registrations#new'
  post '/users', to: 'registrations#create'
end
