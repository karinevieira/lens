# frozen_string_literal: true

require "rails_helper"

RSpec.describe Posts::Unlike, type: :operation do
  describe ".result" do
    context "when like can be destroyed" do
      it "is a success" do
        user = create(:user)
        post = create(:post)
        create(:like, user_id: user.id, post_id: post.id)

        result = described_class.result(post_id: post.id, user_id: user.id)

        expect(result.success?).to be true
      end

      it "removes the like from user" do
        user = create(:user)
        post = create(:post)
        like = create(:like, user_id: user.id, post_id: post.id)

        described_class.result(post_id: post.id, user_id: user.id)

        expect { like.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context "when like cannot be destroyed" do
      it "is a failure" do
        user = create(:user)
        post = create(:post)

        result = described_class.result(post_id: post.id, user_id: user.id)

        expect(result.failure?).to be true
      end

      it "raises cannot unlike error" do
        user = create(:user)
        post = create(:post)
        like = Like.new(post: post, user: user)

        allow(Like).to receive(:find_by)
          .with(user_id: user.id, post_id: post.id)
          .and_return(nil)
        allow(like).to receive(:present?).and_return(false)

        result = described_class.result(post_id: post.id, user_id: user.id)

        expect(result.error).to be :cannot_unlike
      end
    end
  end
end
