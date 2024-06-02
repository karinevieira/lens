# frozen_string_literal: true

require "rails_helper"

RSpec.describe LikesController do
  describe "POST #create" do
    it "requires authentication" do
      post = create(:post)

      post post_likes_path(post)

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "DELETE #destroy" do
    it "requires authentication" do
      post = create(:post)
      like = create(:like, post: post)

      delete post_like_path(post, like)

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
