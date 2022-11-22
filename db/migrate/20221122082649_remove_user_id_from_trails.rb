class RemoveUserIdFromTrails < ActiveRecord::Migration[7.0]
  def change
    remove_index :trails, :user_id
    remove_column :trails, :user_id, :string
  end
end
