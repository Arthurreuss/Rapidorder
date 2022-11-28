Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products, only: %i[destroy]
  resources :orders, only: %i[create index show]
  resources :restaurants, only: %i[new create show edit update destroy] do
    resources :products, only: %i[new create update edit index]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
