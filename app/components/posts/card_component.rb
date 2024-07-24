# frozen_string_literal: true

module Posts
  class CardComponent < ViewComponent::Base
    with_collection_parameter :post

    def initialize(post:, user:)
      @post = post
      @user = user
      @owner = post.user.profile_username
    end

    private

    attr_reader :post, :user, :owner

    def image
      image_tag(url_for(post.image))
    end
  end
end
