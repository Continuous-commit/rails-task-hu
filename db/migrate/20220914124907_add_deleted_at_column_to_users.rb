# frozen_string_literal: true

class AddDeletedAtColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :deleted_at, :datetime, after: :created_at
  end
end
