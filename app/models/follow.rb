# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User", inverse_of: :follower_follows
  belongs_to :followed, class_name: "User", inverse_of: :followed_follows

  validates :follower, uniqueness: { scope: :followed_id }

  validate :follower_and_followed_cannot_be_the_same

  private

  def follower_and_followed_cannot_be_the_same
    return unless follower_id == followed_id

    errors.add(:base, :follower_and_followed_cannot_be_the_same)
  end
end
