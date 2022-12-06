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
  resources :products, only: %i[destroy] do
    resources :reviews, only: %i[create]
  end
  resources :orders, only: %i[create index show]
  resources :categories, only: %i[destroy]
  resources :tables, only: %i[destroy]

  resources :restaurants, only: %i[new create show edit update destroy] do
    get 'dashboard_admin', to: "pages#dashboard_admin", as: "dashboard_admin"
    get 'dashboard_user', to: "pages#dashboard_user", as: "dashboard_user"
    get 'update_status', to: "pages#update_status", as: "update_status"
    resources :tables, only: %i[new create edit update]
    resources :categories, only: %i[new create edit update]
    get 'checkout', to: 'pages#checkout', as: 'checkout'
    resources :products, only: %i[new create update edit index]
    get 'meals', to: "products#meals", as: "restaurant_meals"
    get 'drinks', to: "products#drinks", as: "restaurant_drinks"

  end
  get 'confirmation', to: "pages#render_confirmation", as: 'render_confirmation'
  post 'confirmation', to: 'pages#confirmation', as: 'confirmation'
  get 'reviews', to: 'reviews#new', as: 'reviews'
  get "cart", to: "pages#cart"
  post "cart", to: "pages#render_cart"
  # Defines the root path route ("/")
  # root "articles#index"
end
