Rails.application.routes.draw do
  root "pages#pattern"

  get 'pages/index'
  get 'pages/pattern'

  resources :posts
end
