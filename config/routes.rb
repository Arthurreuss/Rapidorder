Rails.application.routes.draw do
  # get 'orders/index'
  # get 'orders/show'
  # get 'orders/create'
  # get 'orders/update'
  # get 'orders/destroy'
  # get 'restaurants/show'
  # get 'restaurants/new'
  # get 'restaurants/create'
  # get 'restaurants/edit'
  # get 'restaurants/update'
  # get 'restaurants/destroy'
  # get 'products/index'
  # get 'products/new'
  # get 'products/create'
  # get 'products/edit'
  # get 'products/update'
  # get 'products/destroy'
  # get 'reviews/create'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'dashboard_admin', to: "pages#dashboard_admin", as: "dashboard_admin"
  resources :products, only: %i[destroy]
  resources :orders, only: %i[create index show]
  resources :restaurants, only: %i[new create show edit update destroy] do
    resources :products, only: %i[new create update edit index]
  end
   get "cart", to: "pages#cart"
  # Defines the root path route ("/")
  # root "articles#index"
end
