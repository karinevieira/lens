# frozen_string_literal: true

class Post < ApplicationRecord
  has_one_attached :image
end
