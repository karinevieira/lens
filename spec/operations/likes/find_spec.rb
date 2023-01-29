# frozen_string_literal: true

require "rails_helper"

RSpec.describe Likes::Find, type: :operation do
  describe ".result" do
    context "when a like with given post_id and user_id exists" do
      it "is a success" do
        user = create(:user)
        post = create(:post)
        create(:like, user_id: user.id, post_id: post.id)

        result = described_class.result(user_id: user.id, post_id: post.id)

        expect(result.success?).to be true
      end

      it "returns found like for given post_id and user_id" do
        user = create(:user)
        post = create(:post)
        like = create(:like, user_id: user.id, post_id: post.id)

        result = described_class.result(user_id: user.id, post_id: post.id)

        expect(result.like).to eq(like)
      end
    end

    context "when a like with given post_id and user_id doesn't exist" do
      it "is a failure" do
        user = build_stubbed(:user, id: SecureRandom.uuid)
        post = build_stubbed(:post, id: SecureRandom.uuid)

        result = described_class.result(user_id: user.id, post_id: post.id)

        expect(result.failure?).to be true
      end

      it "returns not found error" do
        user = build_stubbed(:user, id: SecureRandom.uuid)
        post = build_stubbed(:post, id: SecureRandom.uuid)

        result = described_class.result(user_id: user.id, post_id: post.id)

        expect(result.error).to be :not_found
      end
    end
  end
end
