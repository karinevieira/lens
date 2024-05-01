# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserProfiles::Update, type: :operation do
  context "with valid attributes" do
    it "updates user profile" do
      profile = create(:user_profile, display_name: "Old display name")

      result = described_class.result(id: profile.id, attributes: { display_name: "New display name" })

      expect(result).to be_success
      expect(profile.reload.display_name).to eq "New display name"
    end
  end

  context "with invalid attributes" do
    it "returns invalid user profile" do
      profile = create(:user_profile, display_name: "Old display name")

      result = described_class.result(id: profile.id, attributes: { display_name: "" })

      expect(result).to be_failure
      expect(result.profile).not_to be_valid
    end
  end

  context "when user profile with given id doesn't exist" do
    it "raises ActiveRecord::RecordNotFound error" do
      expect do
        described_class.result(id: "not-found-id", attributes: { display_name: "New display name" })
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
