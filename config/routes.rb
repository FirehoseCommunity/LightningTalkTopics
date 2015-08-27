Rails.application.routes.draw do

  devise_for :users
  root 'talks#index'
  get '/about', to: 'talks#about'

end
