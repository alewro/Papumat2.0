json.extract! shopping_list, :id, :product_name, :product_quantity, :product_category, :is_bought, :created_at, :updated_at
json.url shopping_list_url(shopping_list, format: :json)
