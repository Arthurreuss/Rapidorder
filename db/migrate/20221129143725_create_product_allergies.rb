class CreateProductAllergies < ActiveRecord::Migration[7.0]
  def change
    create_table :product_allergies do |t|
      t.references :product, null: false, foreign_key: true
      t.references :allergy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
