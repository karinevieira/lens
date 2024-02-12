# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  describe "associations" do
    it { is_expected.to have_many(:likes) }

    it { is_expected.to have_one(:profile) }

    it { is_expected.to accept_nested_attributes_for(:profile) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:profile) }
  end
end
