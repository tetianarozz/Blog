Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
  root "posts#index"

  get 'pages/index'
  get 'pattern', to: "pages#pattern"

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get 'welcome', to: 'sessions#welcome'
  end

