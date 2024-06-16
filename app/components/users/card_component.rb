# frozen_string_literal: true

module Users
  class CardComponent < ViewComponent::Base
    with_collection_parameter :user

    def initialize(user:)
      @user = user
      @profile = user.profile
    end

    private

    attr_reader :user, :profile

    def avatar_image_url
      avatar = profile.avatar
      avatar.present? ? url_for(avatar) : "users/avatar.png"
    end
  end
end
