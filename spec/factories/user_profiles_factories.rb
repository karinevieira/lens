# frozen_string_literal: true

FactoryBot.define do
  factory :user_profile do
    association :user
    display_name { "Jane Doe" }
    sequence(:username) { |n| "janedoe#{n}" }
  end
end
