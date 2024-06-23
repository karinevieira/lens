# frozen_string_literal: true

module UserProfiles
  class Find < Actor
    input :search, type: String, allow_nil: true

    output :profiles, type: Enumerable

    def call
      self.profiles = UserProfile.where(
        "display_name LIKE :search OR username LIKE :search", search: "%#{search}%"
      ).order(created_at: :desc)
    end
  end
end
