Rails.application.routes.draw do
  root "pages#pattern"

  get 'pages/index'
  get 'pages/pattern'

  get '/posts', to: 'posts#index'
end
