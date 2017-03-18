class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :capacity
      t.integer :owner_id

      t.timestamps
    end
  end
end
