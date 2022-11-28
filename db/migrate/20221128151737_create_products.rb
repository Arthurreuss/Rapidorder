class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :description
      t.text :allergies
      t.string :category
      t.string :type
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
