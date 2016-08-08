Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  authenticated :user do
    root 'talks#index', as: :authenticated_root
  end

  root 'static_pages#index'
  get '/about', to: 'talks#about'
  get '/search', to: 'talks#search'
  get '/roster/:date', to: 'talks#roster', as: 'roster'

  resources :admin

  resources :static_pages, only: [:index]

  resources :talks do
    member do
      post 'upvote'
      put 'assign'
      put 'unassign'
    end
  end
end
