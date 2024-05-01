# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserProfile do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:display_name) }
    it { is_expected.to validate_presence_of(:username) }

    it { is_expected.to allow_value("username").for(:username) }
    it { is_expected.to allow_value("username-1").for(:username) }
    it { is_expected.to allow_value("user1name").for(:username) }
    it { is_expected.not_to allow_value("-username").for(:username) }
    it { is_expected.not_to allow_value("username-").for(:username) }
    it { is_expected.not_to allow_value("1username").for(:username) }
    it { is_expected.not_to allow_value("user_name").for(:username) }
    it { is_expected.not_to allow_value("@username").for(:username) }
    it { is_expected.not_to allow_value("username#").for(:username) }
    it { is_expected.not_to allow_value("mariá").for(:username) }

    it { is_expected.to validate_exclusion_of(:username).in_array(UserProfile::NOT_ALLOWED_USERNAMES) }

    it { is_expected.to validate_content_type_of(:avatar).allowing("image/png", "image/jpeg") }

    it "validates uniqueness of username" do
      profile = create(:user_profile)
      expect(profile).to validate_uniqueness_of(:username).case_insensitive
    end
  end
end
