Rails.application.routes.draw do
  devise_for :users
  root 'posts#home'
  resource :posts
end
