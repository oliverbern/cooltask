class AddUserToLists < ActiveRecord::Migration
  def change
    add_column :lists, :user_id, :integer
			add_index :list, :user_id
  end
end
