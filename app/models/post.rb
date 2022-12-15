# frozen_string_literal: true

class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :user

  validates :image, attached: true, content_type: %i[png jpg jpeg]
end
