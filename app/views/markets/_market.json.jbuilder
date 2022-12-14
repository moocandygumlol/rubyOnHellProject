json.extract! market, :id, :user_id, :item_id, :price, :quantity, :created_at, :updated_at
json.url market_url(market, format: :json)
