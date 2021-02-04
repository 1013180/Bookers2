class AddUserToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_reference :relationships, :user, foreign_key: true
    add_reference :relationships, :follow, foreign_key: { to_table: :users }
    add_index :relationships, [:user_id, :follow_id], unique: true
  end
end
