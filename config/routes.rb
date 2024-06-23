# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "posts#index"

  devise_for :users

  get "/@:username", to: "users#show", as: :user

  resources :posts do
    resources :likes, only: %i[create destroy]
  end

  resources :profiles, only: :index
  resource :profile, only: %i[edit update]

  mount Lookbook::Engine, at: "lookbook"
end
