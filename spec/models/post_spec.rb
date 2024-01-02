# frozen_string_literal: true

require "rails_helper"

RSpec.describe Post do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to have_many(:likes) }

  it { is_expected.to validate_attached_of(:image) }
  it { is_expected.to validate_content_type_of(:image).allowing("image/png", "image/jpeg") }
end
