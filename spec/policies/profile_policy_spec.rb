# frozen_string_literal: true

require "rails_helper"

describe ProfilePolicy, type: :policy do
  describe "#edit?" do
    it "is an alias of :update? authorization rule" do
      profile = build_stubbed(:user_profile)
      current_user = build_stubbed(:user)

      policy = described_class.new(profile, user: current_user)
      rule = :edit?

      expect(rule).to be_an_alias_of(policy, :update?)
    end
  end

  describe "#update?" do
    context "when profile belongs to current user" do
      it "returns true" do
        profile = build_stubbed(:user_profile)
        current_user = build_stubbed(:user, profile: profile)
        policy = described_class.new(profile, user: current_user)

        result = policy.apply(:update?)

        expect(result).to be true
      end
    end

    context "when profile doesn't belong to current user" do
      it "returns false" do
        profile = build_stubbed(:user_profile)
        current_user = build_stubbed(:user)
        policy = described_class.new(profile, user: current_user)

        result = policy.apply(:update?)

        expect(result).to be false
      end
    end
  end
end
