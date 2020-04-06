Rails.application.routes.draw do
  
  root 'pages#home'
  
  get 'posts/index', to: 'posts#index'
  
  resources :posts
  
  ################################ OMNIAUTH DEVISE LOGINS ###############################
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  ################################ API ###############################
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :posts, only: %i[index show create update destroy]
    end
  end


end
