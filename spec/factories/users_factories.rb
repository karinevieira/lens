# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "janedoe@email.com" }
    password { "password" }
  end
end
