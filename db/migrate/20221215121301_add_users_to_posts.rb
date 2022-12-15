# frozen_string_literal: true

class AddUsersToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, null: false, foreign_key: true, type: :uuid # rubocop:disable Rails/NotNullColumn
  end
end
