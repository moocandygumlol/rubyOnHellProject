json.extract! inventory, :id, :user_id, :item_id, :seller_id, :price, :quantity, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
