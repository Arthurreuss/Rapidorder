class AddUrlToAllergies < ActiveRecord::Migration[7.0]
  def change
    add_column :allergies, :url, :string
  end
end
