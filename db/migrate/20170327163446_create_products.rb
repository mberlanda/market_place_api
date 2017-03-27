class CreateProducts < ActiveRecord::Migration[5.0]
  def up
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.boolean :published, default:false
      t.integer :user_id

      t.timestamps null:false
    end
    add_index :products, :user_id
  end

  def down
    remove_index :products, :user_id
    drop_table :products
  end
end
