Rails.application.routes.draw do
  devise_for :users
  root to: "trails#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :trails, only: %i[index show] do
    resources :trips, only: :create
  end
    # collection do
    #   get :mine
    # end

  resources :trips, only: %i[index show] do
    resources :reviews, only: %i[create]
  end
end
