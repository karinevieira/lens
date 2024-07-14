# frozen_string_literal: true

require "rails_helper"

RSpec.describe Posts::FeedList, type: :operation do
  describe ".result" do
    it "returns posts from the user and their followed users" do
      current_user = create(:user)
      followed_user = create(:user)
      not_followed_user = create(:user)

      create(:follow, follower: current_user, followed: followed_user)

      post_a = create(:post, user: followed_user)
      _post_b = create(:post, user: not_followed_user)
      post_c = create(:post, user: current_user)

      result = described_class.result(current_user: current_user)

      expect(result.posts).to contain_exactly(post_a, post_c)
    end
  end
end
