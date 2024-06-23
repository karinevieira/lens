# frozen_string_literal: true

module Users
  class ProfileCardComponent < ViewComponent::Base
    with_collection_parameter :profile

    def initialize(profile:)
      @profile = profile
    end

    private

    attr_reader :profile

    def avatar_image_url
      avatar = profile.avatar
      avatar.present? ? url_for(avatar) : "users/avatar.png"
    end
  end
end
