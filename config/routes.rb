Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "posts#index"

  get "pages/index"
  get "pattern", to: "pages#pattern"

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create] do
    member do
      get :confirm_email
    end
  end

  resources :posts do
    get "like", to: "likes#like"
    get "dislike", to: "likes#dislike"
  end

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "log_out", to: "sessions#destroy"
  get "welcome", to: "sessions#welcome"
  get "authorized", to: "sessions#page_requires_login"
end
