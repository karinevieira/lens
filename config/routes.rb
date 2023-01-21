# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "posts#index"

  devise_for :users

  resources :posts do
    resources :likes
  end

  mount Lookbook::Engine, at: "lookbook"
end
