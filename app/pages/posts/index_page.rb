# frozen_string_literal: true

module Posts
  class IndexPage < ApplicationPage
    def initialize(posts:, user:)
      @posts = posts
      @user = user
    end

    private

    attr_reader :posts, :user
  end
end
