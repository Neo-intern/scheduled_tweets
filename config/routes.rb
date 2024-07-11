Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about", to: "about#index"


  resource :registration
  resource :session
  resource :password_reset
  resource :password


  root "main#index"
end
