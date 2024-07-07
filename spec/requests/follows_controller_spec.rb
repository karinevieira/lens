# frozen_string_literal: true

require "rails_helper"

RSpec.describe FollowsController do
  describe "POST #create" do
    it "requires authentication" do
      profile = create(:user_profile)

      post user_follow_path(username: profile.username)

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "DELETE #destroy" do
    it "requires authentication" do
      profile = create(:user_profile)

      delete user_unfollow_path(username: profile.username)

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
