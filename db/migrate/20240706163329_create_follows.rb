# frozen_string_literal: true

class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows, id: :uuid do |t|
      t.references :follower, null: false, foreign_key: { to_table: :users }, type: :uuid
      t.references :followed, null: false, foreign_key: { to_table: :users }, type: :uuid

      t.timestamps
    end

    add_index :follows, %i[follower_id followed_id], unique: true
  end
end
