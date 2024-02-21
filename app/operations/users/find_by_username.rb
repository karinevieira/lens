# frozen_string_literal: true

module Users
  class FindByUsername < Actor
    input :username, type: String

    output :user, type: User

    def call
      profile = UserProfile.find_by(username: username)

      fail!(error: :not_found) if profile.blank?

      self.user = profile.user
    end
  end
end
