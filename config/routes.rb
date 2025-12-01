Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  root "products#index"

  # Products and Categories
  resources :products, only: [ :index, :show ]
  resources :categories, only: [ :show ]

  # Static Pages
  get "pages/:slug", to: "pages#show", as: "page"

  # Shopping Cart
  get "cart", to: "cart#show"
  post "cart/add/:product_id", to: "cart#add", as: "add_to_cart"
  delete "cart/remove/:product_id", to: "cart#remove", as: "remove_from_cart"
  patch "cart/update_quantity/:product_id", to: "cart#update_quantity", as: "update_cart_quantity"
  delete "cart/clear", to: "cart#clear", as: "clear_cart"

  # Orders
  resources :orders, only: [ :new, :create, :show, :index ]

  # User Account
  resource :user, only: [ :show, :edit, :update ]
end
