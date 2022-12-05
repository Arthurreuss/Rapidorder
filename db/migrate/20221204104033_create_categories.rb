class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
    remove_column :products, :category, :string
    add_reference :products, :category, foreign_key: true
  end
end
