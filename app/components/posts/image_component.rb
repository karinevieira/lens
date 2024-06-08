# frozen_string_literal: true

module Posts
  class ImageComponent < ViewComponent::Base
    with_collection_parameter :post

    def initialize(post:)
      @post = post
    end

    private

    attr_reader :post
  end
end
