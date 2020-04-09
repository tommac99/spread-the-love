Rails.application.routes.draw do

  root 'pages#home'
  get 'pages/privacy_policy', to: 'pages#privacy_policy'
  get '/dashboard/:user_id', to: 'posts#dashboard', as: 'dashboard'

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
