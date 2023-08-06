json.extract! all_product, :id, :name, :category, :created_at, :updated_at
json.url all_product_url(all_product, format: :json)
