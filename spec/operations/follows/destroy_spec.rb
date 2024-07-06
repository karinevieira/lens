# frozen_string_literal: true

require "rails_helper"

RSpec.describe Follows::Destroy, type: :operation do
  describe ".result" do
    context "when the follow exists" do
      it "is a success" do
        follower = create(:user)
        followed = create(:user)
        create(:follow, follower: follower, followed: followed)

        result = described_class.result(follower: follower, followed: followed)

        expect(result.success?).to be true
      end

      it "destroys the follow" do
        follower = create(:user)
        followed = create(:user)
        follow = create(:follow, follower: follower, followed: followed)

        described_class.result(follower: follower, followed: followed)

        expect { follow.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context "when the follow doesn't exist" do
      it "is a failure" do
        follower = build_stubbed(:user)
        followed = build_stubbed(:user)

        result = described_class.result(follower: follower, followed: followed)

        expect(result.failure?).to be true
      end

      it "returns record_not_found error" do
        follower = build_stubbed(:user)
        followed = build_stubbed(:user)

        result = described_class.result(follower: follower, followed: followed)

        expect(result.error).to eq(:record_not_found)
      end
    end
  end
end
