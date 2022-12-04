class AddProductTypeToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :product_type, :string
  end
end
