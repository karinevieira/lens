# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    it "returns http status ok" do
      get posts_path

      expect(response).to have_http_status :ok
    end
  end

  describe "GET /new" do
    it "returns http status ok" do
      get new_post_path

      expect(response).to have_http_status :ok
    end
  end

  describe "POST /posts" do
    it "returns http status found" do
      params = { post: { subtitle: "My test subtitle" } }
      post posts_path, params: params

      expect(response).to have_http_status :found
    end
  end
end
