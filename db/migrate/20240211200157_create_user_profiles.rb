# frozen_string_literal: true

class CreateUserProfiles < ActiveRecord::Migration[7.0]
  enable_extension "citext"

  def change
    create_table :user_profiles, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.citext :username, null: false, unique: true
      t.text :display_name, null: false
      t.text :bio

      t.timestamps
    end

    add_index :user_profiles, :username, unique: true
  end
end
