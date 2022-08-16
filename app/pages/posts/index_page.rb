# frozen_string_literal: true

module Posts
  class IndexPage < ApplicationPage
    attr_reader :posts

    def initialize(posts:)
      @posts = posts
    end
  end
end
