# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::FindByUsername, type: :operation do
  context "when user with given username exists" do
    it "is a success" do
      user = create(:user)
      create(:user_profile, username: "johndoe", user: user)

      result = described_class.result(username: "johndoe")

      expect(result.success?).to be true
    end

    it "returns found user for given username" do
      user = create(:user)
      create(:user_profile, username: "johndoe", user: user)

      result = described_class.result(username: "johndoe")

      expect(result.user).to eq(user)
    end
  end

  context "when user with given username doesn't exist" do
    it "is a failure" do
      result = described_class.result(username: "not-found-username")

      expect(result.failure?).to be true
    end

    it "returns not found error" do
      result = described_class.result(username: "not-found-username")

      expect(result.error).to be :not_found
    end
  end
end
