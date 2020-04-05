Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  get 'posts/index', to: 'posts#index'
  
  resources :posts

  ################################ API ###############################
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :posts, only: %i[index show create update destroy]
    end
  end


end
