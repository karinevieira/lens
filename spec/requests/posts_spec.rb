# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostsController do
  describe "GET #index" do
    it "requires authentication" do
      get posts_path

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "GET #new" do
    it "requires authentication" do
      get new_post_path

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "GET #edit" do
    it "requires authentication" do
      post = create(:post)

      get edit_post_path(post)

      expect(response).to redirect_to(new_user_session_path)
    end

    it "requires authorization" do
      user = sign_in
      post = create(:post, user: user)

      expect { get edit_post_path(post) }.to be_authorized_to(:update?, post).with(PostPolicy)
    end
  end

  describe "POST #create" do
    it "requires authentication" do
      post posts_path

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "PUT #update" do
    it "requires authentication" do
      post = create(:post)

      put post_path(post), params: { post: { subtitle: "New subtitle" } }

      expect(response).to redirect_to(new_user_session_path)
    end

    it "requires authorization" do
      user = sign_in
      post = create(:post, user: user)

      expect do
        put post_path(post), params: { post: { subtitle: "New subtitle" } }
      end.to be_authorized_to(:update?, post).with(PostPolicy)
    end
  end
end
