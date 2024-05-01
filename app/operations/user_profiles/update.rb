# frozen_string_literal: true

module UserProfiles
  class Update < Actor
    input :id, type: String
    input :attributes, type: Hash

    output :profile, type: UserProfile

    def call
      self.profile = UserProfile.find(id)

      fail!(error: :invalid_record) unless profile.update(attributes)
    end
  end
end
