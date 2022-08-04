Rails.application.routes.draw do
  devise_for :users

  root "users#index"

  resources :users, only: [:show, :index]

  resources :users do
    member do
      post 'create_request'
    end
  end
end
