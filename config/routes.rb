# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "posts#index"

  devise_for :users

  scope "@:username", as: "user", controller: "users", param: :username do
    get "", action: :show
    post "follow", to: "follows#create", as: :follow
    delete "unfollow", to: "follows#destroy", as: :unfollow
  end

  resources :posts do
    resources :likes, only: %i[create destroy]
  end

  resources :profiles, only: :index
  resource :profile, only: %i[edit update]

  mount Lookbook::Engine, at: "lookbook"
end
