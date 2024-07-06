# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  describe "associations" do
    it { is_expected.to have_one(:profile) }

    it do
      expect(described_class.new).to have_many(:follower_follows).class_name("Follow").inverse_of(:follower)
        .dependent(:destroy).with_foreign_key("follower_id")
    end

    it do
      expect(described_class.new).to have_many(:followed_follows).class_name("Follow").inverse_of(:followed)
        .dependent(:destroy).with_foreign_key("followed_id")
    end

    it { is_expected.to have_many(:following).through(:follower_follows).source(:followed) }
    it { is_expected.to have_many(:followers).through(:followed_follows).source(:follower) }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_many(:posts) }

    it { is_expected.to accept_nested_attributes_for(:profile) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:profile) }
  end
end
