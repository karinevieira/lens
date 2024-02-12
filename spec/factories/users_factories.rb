# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@email.com" }
    password { "password" }

    transient do
      sequence(:username) { |n| "janedoe#{n}" }
    end

    profile_attributes do
      { display_name: "Jane Crawford", username: username }
    end
  end
end
