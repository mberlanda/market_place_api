class AddQuantityToProducts < ActiveRecord::Migration[5.0]
  def up
    add_column :products, :quantity, :integer
  end

  def down
    remove_column :products, :quantity
  end
end
