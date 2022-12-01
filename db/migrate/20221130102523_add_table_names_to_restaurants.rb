class AddTableNamesToRestaurants < ActiveRecord::Migration[7.0]
  def change
    remove_column :restaurants, :tables, :string, array: true
    add_column :restaurants, :table_names, :string
  end
end
