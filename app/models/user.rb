# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_one :profile, class_name: "UserProfile", dependent: :destroy

  has_many :follower_follows, class_name: "Follow", inverse_of: :follower, dependent: :destroy,
    foreign_key: "follower_id"
  has_many :following, through: :follower_follows, source: :followed
  has_many :followed_follows, class_name: "Follow", inverse_of: :followed, dependent: :destroy,
    foreign_key: "followed_id"
  has_many :followers, through: :followed_follows, source: :follower
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy

  accepts_nested_attributes_for :profile, update_only: true

  validates :profile, presence: true

  delegate :bio, :display_name, :username, to: :profile, prefix: true

  def following?(user)
    following.exists?(user.id)
  end
end
