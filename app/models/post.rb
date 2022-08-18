# frozen_string_literal: true

class Post < ApplicationRecord
  has_one_attached :image

  validates :image, attached: true, content_type: %i[png jpg jpeg]
end
