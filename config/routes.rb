Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :trails, only: %i[index show] do
    resources :trips, only: :create
    # collection do
    #   get :mine
    # end
  end
  resources :trips, only: %i[index show]
end
