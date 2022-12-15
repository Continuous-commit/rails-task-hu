# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :likable, polymorphic: true

      t.timestamps
    end
    add_index :likes, %i[user_id likable_id likable_type], unique: true
  end
end
