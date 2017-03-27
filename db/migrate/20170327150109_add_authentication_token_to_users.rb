class AddAuthenticationTokenToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :auth_token, :string, default: ""
    add_index :users, :auth_token, unique: true
  end

  def down
    remove_index :users, :auth_token
    remove_column :users, :auth_token
  end
end
