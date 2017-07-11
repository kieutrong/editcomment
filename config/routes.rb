Rails.application.routes.draw do
  root "static_pages#home"

  get "/help", to: "static_pages#help"

  get "/introduce",to: "static_pages#introduce"

  devise_for :users
  resources :users
end
