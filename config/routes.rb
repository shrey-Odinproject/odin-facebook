Rails.application.routes.draw do

  devise_for :users

  root "users#index"

  resources :users, only: [:show, :index]

  resources :users do
    member do
      post 'create_request'
      post 'accept_request'
      post 'decline_request'
    end
  end

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
