# frozen_string_literal: true

module Follows
  class Create < Actor
    input :follower, type: User
    input :followed, type: User

    def call
      follow = Follow.new(follower: follower, followed: followed)

      fail!(error: :invalid_record) unless follow.save
    end
  end
end
