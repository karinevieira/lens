# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "posts#new"

  resources :posts, only: %i[new create]

  mount Lookbook::Engine, at: "lookbook"
end
