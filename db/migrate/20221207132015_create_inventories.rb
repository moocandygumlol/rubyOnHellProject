class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :seller_id, index: true
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end

    add_foreign_key :inventories, :users, column: :seller_id
  end
end
