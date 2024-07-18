Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about", to: "about#index"
  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"

  # resource :registration
  # resource :session
  # resource :password_reset
  # resource :password

  resources :twitter_accounts
  resources :tweets

  root "main#index"
end
