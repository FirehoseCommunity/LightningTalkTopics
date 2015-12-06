Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'talks#index'
  get '/about', to: 'talks#about'
  resources :talks do
    member do
      post 'upvote'
      put 'assign'
      put 'unassign'
      get 'roster'
    end
  end
end
