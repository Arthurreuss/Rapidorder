class AddTablesToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :tables, :string, array: true
  end
end
