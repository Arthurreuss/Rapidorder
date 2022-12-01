class AddDefaultToOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :status, :boolean
    add_column :orders, :status, :boolean, default: false, null: false
    remove_column :orders, :table_id, :string
    add_reference :orders, :table, foreign_key: true
  end
end
