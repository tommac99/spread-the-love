Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'pages/index', to: 'pages#index'
end
