Rails.application.routes.draw do
  get '/', to: 'application#home'
  root 'application#home'
  get '/home', to: 'application#home'
  get '/contact', to: 'application#contact'
  get '/team', to: 'application#team'
  
  resources :homes
  resources :gossips
  resources :users
  resources :citys
  resources :sessions

  delete '/logout', to: 'sessions#destroy', as: 'logout'

end