class AddColumnsToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :description, :string
    add_column :restaurants, :phone_number, :string
    add_column :restaurants, :open_time, :time
    add_column :restaurants, :close_time, :time
    add_column :restaurants, :price, :integer
  end
end
