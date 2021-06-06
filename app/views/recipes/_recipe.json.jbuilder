json.extract! recipe, :id, :recipe_url, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
