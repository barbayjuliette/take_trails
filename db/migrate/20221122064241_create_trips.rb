class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.references :user, foreign_key: true
      t.references :trail, foreign_key: true
      t.datetime :date
      t.timestamps
    end
  end
end
