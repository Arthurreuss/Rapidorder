class AddCategoryNamesToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :category_names, :string
    add_reference :categories, :restaurant, foreign_key: true
  end
end
