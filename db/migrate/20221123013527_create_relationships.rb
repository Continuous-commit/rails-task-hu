class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :follower, foreign_key: {to_table: :users}, null: false
      t.references :followed, foreign_key: {to_table: :users}, null: false

      t.timestamps

      t.index [:follower_id, :followed_id], unique: true
    end
  end
end
