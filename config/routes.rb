Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'talks#index'
  get '/about', to: 'talks#about'
  get '/roster/:date', to: 'talks#roster', as: 'roster'
  resources :talks do
    member do
      post 'upvote'
      put 'assign'
      put 'unassign'
    end
  end
end
