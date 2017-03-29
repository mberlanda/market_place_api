class AddQuantityToPlacements < ActiveRecord::Migration[5.0]
  def up
    add_column :placements, :quantity, :integer, default: 0
  end

  def down
    remove_column :placements, :quantity
  end
end
