Rails.application.routes.draw do

  devise_for :users
  root 'talks#index'
  get 'About', to: 'talks#about'

end
