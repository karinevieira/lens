# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProfilesController do
  describe "GET #edit" do
    it "requires authentication" do
      get edit_profile_path

      expect(response).to redirect_to(new_user_session_path)
    end

    it "requires authorization" do
      user = sign_in
      expect { get edit_profile_path }.to be_authorized_to(:update?, user.profile).with(ProfilePolicy)
    end
  end

  describe "PUT #update" do
    it "requires authentication" do
      params = { user_profile: { display_name: "Jane", bio: "Software Engineer" } }

      put profile_path, params: params

      expect(response).to redirect_to(new_user_session_path)
    end

    it "requires authorization" do
      user = sign_in
      params = { user_profile: { display_name: "Jane", bio: "Software Engineer" } }

      expect { put profile_path, params: params }.to be_authorized_to(:update?, user.profile).with(ProfilePolicy)
    end
  end
end
