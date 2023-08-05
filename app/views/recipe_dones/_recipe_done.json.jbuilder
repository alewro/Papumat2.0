json.extract! recipe_done, :id, :is_done, :created_at, :updated_at
json.url recipe_done_url(recipe_done, format: :json)
