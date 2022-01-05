Rails.application.routes.draw do
  root 'pages#pattern'

  get '/pages', to: 'pages#pattern'
end
