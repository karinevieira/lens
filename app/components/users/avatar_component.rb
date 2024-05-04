# frozen_string_literal: true

module Users
  class AvatarComponent < ViewComponent::Base
    def initialize(user:)
      @user = user
    end

    private

    attr_reader :user

    def image_url
      user.profile.avatar.present? ? url_for(user.profile.avatar) : "users/avatar.png"
    end
  end
end
