class AddIndexToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_index :restaurants, :tables, using: 'gin'
  end
end
