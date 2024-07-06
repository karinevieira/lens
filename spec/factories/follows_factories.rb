# frozen_string_literal: true

FactoryBot.define do
  factory :follow do
    association :follower, factory: :user, strategy: :create
    association :followed, factory: :user, strategy: :create
  end
end
