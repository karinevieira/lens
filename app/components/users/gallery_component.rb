# frozen_string_literal: true

module Users
  class GalleryComponent < ViewComponent::Base
    def initialize(posts:)
      @posts = posts
    end

    private

    attr_reader :posts
  end
end
