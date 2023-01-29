# frozen_string_literal: true

module Likes
  class Find < Actor
    input :user_id, type: String
    input :post_id, type: String

    output :like, type: Like

    def call
      self.like = Like.find_by(user_id: user_id, post_id: post_id)
      fail!(error: :not_found) if like.blank?
    end
  end
end
