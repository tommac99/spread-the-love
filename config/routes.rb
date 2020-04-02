Rails.application.routes.draw do
  devise_for :users
  root 'posts#home'

  get 'pages/index', to: 'pages#index'
  
  resource :posts
end
