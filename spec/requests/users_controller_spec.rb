# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController do
  describe "GET #show" do
    it "doesn't require authentication" do
      profile = create(:user_profile)

      get user_path(username: profile.username)

      expect(response).not_to redirect_to(new_user_session_path)
    end
  end
end
