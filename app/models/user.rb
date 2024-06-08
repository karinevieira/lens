# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_one :profile, class_name: "UserProfile", dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy

  accepts_nested_attributes_for :profile, update_only: true

  validates :profile, presence: true
end
