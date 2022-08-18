Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  root "users#index"

  resources :users, only: [:show, :index]

  resources :requests, only: [:create, :update, :destroy]

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :profiles, except: [:inedx, :show]
end
