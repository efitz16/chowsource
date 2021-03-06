Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/recipes/top10', to: 'recipes#top10', as: 'ratings'

  resources :users, :except => [:new, :create]

  resources :searches, :only => [:show, :index]

  resources :recipes do
    resources :ratings, only: [:create]
    resources :ingredients, shallow: true
  end
end
