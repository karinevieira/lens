# frozen_string_literal: true

module Users
  class AvatarComponent < ViewComponent::Base
    attr_reader :image_url

    def initialize(image_url:)
      @image_url = image_url
    end

    private

    def render?
      image_url.present?
    end
  end
end
