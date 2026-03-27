Rails.application.routes.draw do
  get "cart_items/create"
  get "cart_items/update"
  get "cart_items/destroy"
  get "checkout/index"
  get "checkout/confirm"
  get "checkout/create"
  get "categories/show"
  devise_for :users
  get "search/index"
  get "cart/show"
  # ActiveAdmin and Devise setup
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :products, only: [:index, :show]
  root 'products#index'
  get "/cart", to: "cart#show", as: :cart
  resources :cart_items, only: [:create, :update, :destroy]

  get "/search", to: "search#index", as: :search

  resources :categories, only: [:show]

  resource :checkout, only: [:index, :create] do
    get :confirm
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end