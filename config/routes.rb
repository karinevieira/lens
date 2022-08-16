# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "posts#index"

  resources :posts, only: %i[index new create]

  mount Lookbook::Engine, at: "lookbook"
end
