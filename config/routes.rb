Rails.application.routes.draw do

  devise_for :users
  root to: "trails#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :trails, only: %i[index show] do
    resources :trips, only: :create

    member do
      post 'toggle_favorite', to: "trails#toggle_favorite"
    end

  end



  resources :trips, only: %i[index show] do
    resources :reviews, only: %i[create]
    resources :tasks, only: %i[create ]
  end

  resources :trips, only: %i[index show]

  resources :tasks, only: %i[index show destroy edit update]

  post "tasks/:id/toggle", to: "tasks#toggle"
  get '/bookmarks', to: 'favorites#index', as: 'bookmarks'

end
