class AddCoordinatesToTrails < ActiveRecord::Migration[7.0]
  def change
    add_column :trails, :coordinates, :string
  end
end
