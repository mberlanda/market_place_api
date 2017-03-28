class CreateOrders < ActiveRecord::Migration[5.0]
  def up
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.decimal :total

      t.timestamps null: false
    end
  end

  def down
    drop_table :orders
  end
end
