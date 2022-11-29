class ChangeAllergiesFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :allergies, :string
  end
end
