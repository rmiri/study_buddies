class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.integer :capacity
      t.string :city

      t.timestamps
    end
  end
end
