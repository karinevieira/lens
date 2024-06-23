# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserProfiles::Find, type: :operation do
  context "when searched by display_name" do
    it "return profiles found ordered by creation date in descending order" do
      profile_a = create(:user_profile, display_name: "Karine Vieira", created_at: 1.week.ago)
      _profile_b = create(:user_profile, display_name: "Tiago Guimarães", created_at: Time.zone.now)
      profile_c = create(:user_profile, display_name: "Matheus Vieira", created_at: Time.zone.yesterday)

      result = described_class.result(search: "Vieira")

      expect(result.profiles).to contain_exactly(profile_c, profile_a)
    end
  end

  context "when searched by username" do
    it "return profiles found ordered by creation date in descending order" do
      profile_a = create(:user_profile, username: "karinevieira", created_at: 1.week.ago)
      _profile_b = create(:user_profile, username: "tiagoguimaraes", created_at: Time.zone.now)
      profile_c = create(:user_profile, username: "matheusvieira", created_at: Time.zone.yesterday)

      result = described_class.result(search: "vieira")

      expect(result.profiles).to contain_exactly(profile_c, profile_a)
    end
  end

  context "when search is not given" do
    it "return profiles ordered by creation date in descending order" do
      profile_a = create(:user_profile, created_at: 1.week.ago)
      _profile_b = create(:user_profile, created_at: Time.zone.now)
      profile_c = create(:user_profile, created_at: Time.zone.yesterday)

      result = described_class.result(search: nil)

      expect(result.profiles).to end_with(profile_c, profile_a)
    end
  end
end
