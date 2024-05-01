# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProfilesController do
  describe "GET #edit" do
    it "returns http status found" do
      get edit_profile_path

      expect(response).to have_http_status :found
    end
  end

  describe "PUT #update" do
    it "returns http status found" do
      params = { user_profile: { display_name: "Jane", bio: "Software Engineer" } }

      put profile_path, params: params

      expect(response).to have_http_status :found
    end
  end
end
