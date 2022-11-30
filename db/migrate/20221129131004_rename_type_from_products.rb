class RenameTypeFromProducts < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :type, :product_type
  end
end
