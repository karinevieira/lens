# frozen_string_literal: true

module Posts
  class IndexPage < ApplicationPage
    attr_reader :posts, :user

    def initialize(posts:, user:)
      @posts = posts
      @user = user
    end
  end
end
