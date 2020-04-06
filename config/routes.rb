Rails.application.routes.draw do
  
  root 'pages#home'
  get 'posts/home', to: 'posts#home'

  
  get 'posts/index', to: 'posts#index'
  
  resources :posts
  
  ################################ OMNIAUTH DEVISE LOGINS ###############################
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  ################################ API ###############################
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :posts, only: %i[index show create update destroy]
    end
  end


end
