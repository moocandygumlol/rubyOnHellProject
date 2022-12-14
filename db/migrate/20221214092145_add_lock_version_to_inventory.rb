class AddLockVersionToInventory < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :lock_version, :integer
  end
end
