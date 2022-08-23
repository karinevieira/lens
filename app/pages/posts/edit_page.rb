# frozen_string_literal: true

module Posts
  class EditPage < ApplicationPage
    attr_reader :post

    def initialize(post:)
      @post = post
    end
  end
end
