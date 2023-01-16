# frozen_string_literal: true

class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :user

  has_many :likes, dependent: :destroy

  validates :image, attached: true, content_type: %i[png jpg jpeg]
end
