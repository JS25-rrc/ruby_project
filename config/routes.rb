Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'products#index'
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]

  get "/cart", to: "cart#show", as: :cart
  get "/search", to: "search#index", as: :search

  get "/checkout", to: "checkout#index", as: :checkout
  post "/checkout", to: "checkout#create"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end