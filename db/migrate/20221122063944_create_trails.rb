class CreateTrails < ActiveRecord::Migration[7.0]
  def change
    create_table :trails do |t|
      t.string :name, null: false
      t.string :difficulty, null: false
      t.float :distance, null: false
      t.float :duration, null: false
      t.string :location, null: false
      t.text :description, null: false


      t.timestamps
    end
  end
end
