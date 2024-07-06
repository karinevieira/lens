# frozen_string_literal: true

require "rails_helper"

RSpec.describe Follows::Create, type: :operation do
  describe ".result" do
    context "when follower and followed are not the same" do
      it "is a success" do
        follower = create(:user)
        followed = create(:user)

        result = described_class.result(follower: follower, followed: followed)

        expect(result.success?).to be true
      end

      it "creates the follow" do
        follower = create(:user)
        followed = create(:user)

        expect do
          described_class.result(follower: follower, followed: followed)
        end.to change(Follow, :count).by(1)
      end
    end

    context "when follower and followed are the same" do
      it "is a failure" do
        user = create(:user)

        result = described_class.result(follower: user, followed: user)

        expect(result.failure?).to be true
      end

      it "doesn't creates the follow" do
        user = create(:user)

        expect do
          described_class.result(follower: user, followed: user)
        end.not_to change(Follow, :count)
      end
    end
  end
end
