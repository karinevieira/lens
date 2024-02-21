# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users" do
  describe "GET /show" do
    it "returns http status ok" do
      profile = create(:user_profile)

      get user_path(username: profile.username)

      expect(response).to have_http_status :ok
    end
  end
end
