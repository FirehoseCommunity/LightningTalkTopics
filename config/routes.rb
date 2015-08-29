Rails.application.routes.draw do

  devise_for :users
  root 'talks#index'
  get '/about', to: 'talks#about'

  resources :talks do
    member do
      post 'upvote'
    end
  end

end
