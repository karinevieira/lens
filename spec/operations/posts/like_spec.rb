# frozen_string_literal: true

require "rails_helper"

RSpec.describe Posts::Like, type: :operation do
  describe ".result" do
    it "is a success" do
      user = create(:user)
      post = create(:post)
      result = described_class.result(post_id: post.id, user_id: user.id)

      expect(result.success?).to be true
    end

    it "adds a new like to the post" do
      user = create(:user)
      post = create(:post)
      result = described_class.result(post_id: post.id, user_id: user.id)

      expect(result.post.likes.reload.first.attributes).to include(
        "post_id" => post.id,
        "user_id" => user.id
      )
    end

    it "changes the post likes count" do
      user = create(:user)
      post = create(:post)

      expect do
        described_class.result(post_id: post.id, user_id: user.id)
      end.to change(post.likes, :count).by(1)
    end

    context "when an error occurs" do
      it "rollbacks transaction" do
        user = create(:user)
        post = create(:post)
        like = Like.new(post: post, user: user)

        allow(Posts::Find).to receive(:result)
          .with(id: post.id)
          .and_return(ServiceActor::Result.new(post: post))
        allow(post.likes).to receive(:build).and_return(like)
        allow(like).to receive(:save!).and_raise("some error")

        described_class.result(post_id: post.id, user_id: user.id)

        expect(post.likes.reload).to be_empty
      end

      it "is a failure" do
        user = create(:user)
        post = create(:post)
        like = Like.new(post: post, user: user)

        allow(Posts::Find).to receive(:result)
          .with(id: post.id)
          .and_return(ServiceActor::Result.new(post: post))
        allow(post.likes).to receive(:build).and_return(like)
        allow(like).to receive(:save!).and_raise("some error")

        result = described_class.result(post_id: post.id, user_id: user.id)

        expect(result.failure?).to be true
      end
    end
  end
end
