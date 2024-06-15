# frozen_string_literal: true

module Posts
  class CardComponent < ViewComponent::Base
    with_collection_parameter :post

    def initialize(post:, user:)
      @post = post
      @user = user
    end

    private

    attr_reader :post, :user

    def image
      image_tag(url_for(post.image))
    end
  end
end
