# frozen_string_literal: true

module Follows
  class Destroy < Actor
    input :follower, type: User
    input :followed, type: User

    def call
      follow = Follow.find_by(follower: follower, followed: followed)

      fail!(error: :record_not_found) if follow.nil?
      fail!(error: :record_not_destroyed) unless follow.destroy
    end
  end
end
