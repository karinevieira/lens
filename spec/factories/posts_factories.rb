# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    association :user, strategy: :create
    image { Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/image.png"), "image/png") }
    subtitle { "My subtitle" }
  end
end
